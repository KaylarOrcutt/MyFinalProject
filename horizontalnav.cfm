<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="images/rdb.png" alt="Read Dees Books Logo"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Store Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Highlighted Favorites</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Events</a>
            </li>
        </ul>
        <cfoutput>
            <form class="d-flex" action="#cgi.SCRIPT_NAME#?p=details"  method="POST">
                <input name= "searchme" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form> 
   
    <ul class="nvar-nav mr-auto">
        <lu class-"nav-item">
            <a class="nav-link" href="#cgi.SCRIPT_NAME#?p=login">Login</a>

    </u>
</cfoutput>


    </div>
</nav>