import json
import Habit
import Session
import User
import cgi
import datetime
import hashlib

from dateutil.relativedelta import relativedelta
from bottle import route, get, post, put, debug, run, request, redirect
from bottle import template, static_file, error, response, HTTP_CODES, abort
from pymongo import MongoClient


####
# ROUTES
####

@route('/')
def get_welcome():
    username = check_logged_in()

    if username:
        redirect('/habits/daily')

    return template('welcome', dict(title='welcome'))

@route('/edit_profile')
def get_edit_profile():
    username = check_logged_in()
    return template('edit_profile', dict(title='edit profile', username=username))

@route('/signup')
def get_signup():
    return template('signup', dict(title='sign up', username='', email='', password='', password_error='',
                                   username_error='', email_error='', verify_error =''))

@route('/signin')
def get_signin():
    return template('signin', dict(title='sign in', username='', password='', login_error=''))

@route('/habits')
def get_habits():

    redirect('/habits/daily')

@route('/habits/<interval>')
def get_interval_habits(interval):
    username = check_logged_in()
    user = users.get_user(username)
    today = datetime.datetime.now()
    earliest_date, delta = None, None

    l = habits.get_user_habits(username, interval)

    if len(l) > 0:
        earliest_date = habits.get_oldest_habit_date(username, interval)
        earliest_date = datetime.datetime.strptime(earliest_date, '%Y-%m-%d')
        delta = today - earliest_date

    return template(interval, dict(title=interval + ' habits', user=user, myhabits=l, username=user['username'],
                                   intervals=delta, earliest_date=earliest_date, datetime=datetime,
                                   interval=interval))

@route('/habit/<name>/edit')
def edit_habit(name):
    username = check_logged_in()
    habit = habits.get_habit(name.replace('_', ' '), username)
    return template('edit_habit', dict(habit=habit, username=username, title='edit' + habit['name']))

@route('/habit/<name>')
def habit(name):
    habit = habit.get_habit(name)
    return template('habit', dict(habit=habit, name=habit['_id']))

@route('/newhabit')
def newhabit():
    username = check_logged_in()
    return template('new_habit', dict(username=username, title='new habit', name='', interval = '',
                                      occurence='', reminders='', categories=''))

@route('/categories')
def get_categories():
    username = check_logged_in()
    categories = habits.get_categories(username)
    return template('categories', dict(title='categories', username=username,
                                       categories=categories))

@route('/profile')
def get_profile():
    username = check_logged_in()
    user = users.get_user(username)
    l = habits.get_user_habits(username)
    categories = habits.get_categories(username)
    best_habits = habits.get_best_habits(username)
    worst_habits = habits.get_worst_habits(username)
    return template('profile', dict(title='profile', user=user, habits=l, username=user['username'],
                                    categories=categories, best_habits=best_habits,
                                    worst_habits=worst_habits))

@route('/graphs')
def get_graphs():
    username = check_logged_in()
    return template('graphs', dict(title='graphs', username=username))

@route('/logout')
def logout():
    cookie = request.get_cookie('session')
    sessions.end_session(cookie)
    response.set_cookie('session', '')
    return template('welcome', dict(title='welcome'))


####
# POSTS
####

@post('/newhabit')
def post_new_habit():
    username = check_logged_in()
    name = request.forms.get('name')
    interval = request.forms.get('interval')
    occurence = request.forms.get('occurence')
    reminders = request.forms.get('reminders')
    categories = request.forms.get('categories').split(',')
    habits.insert_habit(username, name, interval, occurence, reminders, categories)

    redirect('/habits')

@post('/signin')
def signin():
    username = request.forms.get('username')
    password = request.forms.get('password')

    user_record = users.validate_login(username, password)
    if user_record:
        session_id = sessions.begin_session(user_record['_id'])

        if session_id is None:
            redirect('/internal_error')

        cookie = session_id
        response.set_cookie('session', cookie)

        habits.refresh_habits(username)

        redirect('/habits/daily')

    else:
        return template('signin', dict(username=cgi.escape(username), password='',
                                    login_error='invalid login'))

@post('/signup')
def signup():
    username = request.forms.get('username')
    email = request.forms.get('email')
    password = request.forms.get('password')
    verify = request.forms.get('verify')

    errors = {'username': cgi.escape(username), 'email': cgi.escape(email)}
    if users.validate_signup(username, email, password, verify, errors):

        if not users.add_user(username, email, password):  
            errors['username_error'] = 'username already taken'
            return template('signup', errors)

        session_id = sessions.begin_session(username)
        print 'session id: ', session_id
        response.set_cookie('session', session_id)
        redirect('/')
    else:
        print 'user did not validate'
        return template('signup', errors)

####
# PUTS
####

## TODO

@put('/edithabit')
def edit_habit():
    name = request.forms.get('name')
    times = request.forms.get('times')
    occurence = request.forms.get('occurence')
    reminders = request.forms.get('reminders')
    categories = request.forms.get('categories')

    habits.update(name, times, occurence, reminders, categories)

    redirect('/')

####
# STATIC FILES
####

@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root='static/')

####
# ERRORS
####

@error(404)
def error_404(error):
    cookie = request.get_cookie('session')
    username = sessions.get_username(cookie)
    return template('error', dict(title='error', username=username, error=error, 
                                  logged_in= True if username else False))

@error(500)
def error_500(error):
    cookie = request.get_cookie('session')
    username = sessions.get_username(cookie)
    return template('error', dict(title='error', username=username, error=error,
                                  logged_in= True if username else False))

####
# REST FOR HABITS
####

@route('/habits/get/:id', method='GET')
def get_habit(id):
    habit = database.habits.find_one({'_id':id})
    if not habit:
        abort(404, 'no habit with id %s' % id)
    return habit

@route('/habits/put/:id', method='PUT')
def put_habit(id):
    data = request.body.readline()
    if not data:
        abort(400, 'no data received')
    habit = json.loads(data)
    interval = [(key, value) for (key, value) in habit.iteritems() if key.startswith('completedIntervals')][0]
    if not habit.has_key('_id'):
        abort(400, 'no _id specified')
    try:
        database.habits.update({'_id' : habit['_id']}, {'$set' : { interval[0] : interval[1] } }, upsert=False)
        return dict(success=True)
    except TypeError as ve:
        abort(400, str(ve))

####
# HELPER FUNCTIONS
####

def check_logged_in():
    cookie = request.get_cookie('session')
    username = sessions.get_username(cookie)
    if username is None:
        redirect('/welcome')
    else:
        return username

client = MongoClient('localhost', 27017)
database = client.hbt

habits = Habit.Habit(database)
sessions = Session.Session(database)
users = User.User(database)

debug(True)
run(host='localhost', port=8080) 