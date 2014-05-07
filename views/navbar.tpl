<!-- Begin navbar. -->

<div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">hbt</a>
    </div>
    <div class="navbar-collapse collapse">
      %if logged_in:
        <ul class="nav navbar-nav">
          <li><a href="/habits">habits</a></li>
          <li><a href="/categories">categories</a></li>
          <li><a href="/graphs">graphs</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{username}}<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="/profile">profile</a></li>
              <li><a href="/logout">logout</a></li>
            </ul>
          </li>
        </ul>
      %else:
        <ul class="nav navbar-nav">
          <li><a href="#what">what</a></li>
          <li><a href="#why">why</a></li>
          <li><a href="#how">how</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li style="margin-right: 10px;">
              <form action="/signin">
                  <button class="btn btn-default navbar-btn">sign in</button>
              </form>
          </li>
          <li>
            <form action="/signup">
                <button class="btn btn-default navbar-btn">sign up</button>
            </form>
          </li>
        </ul>
      %end
    </div>
  </div>
</div>

<!-- End navbar. -->

<!-- Begin content. -->

<body>