%include ('head.tpl', title=title, css='carousel')

%include ('navbar.tpl', logged_in=False)


    <div class="jumbotron">
      <div class="container">
        <h1>decide to be better, one habit at a time</h1>
        <p><strong>hbt</strong> helps you keep track of the routines that are important to you.</p>
        <p><a class="btn btn-lg btn-default" href="/signup">join today</a></p>
      </div>
    </div>



    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 id="what" class="featurette-heading anchor">what?<br><span class="text-muted">a web-responsive habit tracker.</span></h2>
          <p class="lead"><strong>hbt</strong> is a simple, yet sophisticated, habit and routine tracking application. keep track of habits you want to accomplish daily, weekly, or monthly. drinking enough water, cleaning your room, and going to concerts have never been this easy.</p>
        </div>
        <div class="col-md-5 text-center">
         <i class="fa fa-signal fa-6 large-icon"></i>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 id="why" class="featurette-heading anchor">why?<br><span class="text-muted">you'll become better.</span></h2>
          <p class="lead">in the wise words of Aristotle, "We are what we repeatedly do. Excellence, is then, not an act, but a habit." habits drive the way we live our lives whether they are positive or negative. understanding the routines that make up your life can make your life better.</p>
        </div>
        <div class="col-md-5 text-center">
          <i class="fa fa-star-o medium-icon"></i>&nbsp;<i class="fa fa-star-half-o medium-icon"></i>&nbsp;<i class="fa fa-star medium-icon"></i>
        </div>

      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 id="how" class="featurette-heading anchor">how?<br><span class="text-muted">check it off.</span></h2>
          <p class="lead"><strong>hbt</strong> is web-responsive, which means you can access it on any browser. check off your habits at home on your desktop, at school on your laptop, or on-the-go on your tablet or smartphone.</p>
        </div>
        <div class="col-md-5 text-center">
            <i class="fa fa-square-o medium-icon"></i>&nbsp;&nbsp;<i class="fa fa-check-square-o medium-icon"></i>
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

      <div class="modal fade" id="join" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title text-center" id="myModalLabel">join <strong>hbt</strong></h4>
            </div>
            <div class="modal-body">

                <form class="form-signup" action="/signup" method="post">
                  <h2 class="form-signup-heading text-center">sign up</h2>
                  <input type="text" class="form-control" placeholder="email" name="email" required="" autofocus="" value="">
                  <input type="password" class="form-control" placeholder="password" name="password" required="">
                  <input type="password" class="form-control" placeholder="reenter password" name="verify" required="">
                  <label class="error"><!--username_errorpassword_errorverify_error--></label>
                  <button class="btn btn-lg btn-default btn-block" type="submit">sign up</button>
                </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
            </div>
          </div>
        </div>
      </div>


      <footer>
        <p class="pull-right"><a href="#"><i class="fa fa-arrow-up fa-2x"></i></a></p>
        <p>created by <a href="http://andrewkowalczyk.com">andrew kowalczyk</a>.</p>
      </footer>

    </div>

%include('tail.tpl')
