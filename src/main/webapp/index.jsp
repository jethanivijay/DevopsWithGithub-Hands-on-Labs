<html>
<head>
    <title>MyShuttle Login</title>
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />
    <link rel="stylesheet" type="text/css" href="App/Themes/Lumen/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="App/Modules/Core/Css/core.css">
    <link rel="stylesheet" type="text/css" href="Content/login.css">
</head>
<body>
    <div class="container-fluid full-width-container">
        <section class="container-fluid">
            <div class="row">
                <div class="login_container">
                    <div class="row login_header">
                        <img src="Content/Images/logologin.png">
                    </div>
                    <div class="row">
                        <form action="login" method="post">
                            <div class="form-group">
                                <h4><label class="control-label" for="UserName">Employee email</label></h4>
                                <div class="form-control-div">
                                    <input class="form-control" type="text" id="email" name="email" />
                                </div>
                                    
                                    <h4><label class="control-label" for="Password">Employee password</label></h4>
                                <div class="form-control-div">
                                    <input class="form-control" type="password" id="password" name="password" /><br />
                                    </div>
                                </div>
                            <div class="form-group pull-right login_submit">
                                <input type="submit" value="Log in" class="btn btn-primary" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>