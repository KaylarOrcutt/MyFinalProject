<cfparam name="AccountMessage" default="" />

<script type="text/javascript">
    function validateNewAccount(){
        let orignialPassword= document.getElementById("password").value;
        let confirmPassword= document.getElementById("confirmPassword").value;

        if(originalPassword.length && originalPassword === confirmPassword){
            console.dir("submit the form")
            document.getElementById("accountMessage").innerHTML =  "";
            document.getElementById("submitPage").click();

        } else{
            document.getElementById("accountMessage").innerHTML = 
            "Please check you entered your password and the confirm password entry";
            console.dir("It didn't work");
        }
        console.dir(originalPassword);
        console.dir(cofirmPassword);
    }

</script>
<cfoutput>
<div id="accountMessage">#accountMessage#</div>
</cfoutput>

<form action="#cgi.SCRIPT_NAME#?p=login" method="post">
    <div class="form-floating mb-3">
        <input type="text" id="title" name="title"  placeholder="Pleas enter Mr./Ms./Mrs./Sir" class="form-control" />
        <label for="title">Title</label>
    </div>
    <div class="form-floating mb-3">
        <input type="text" id="firstname" name="firstname"  placeholder="Pleas Enter Your First name" class="form-control" required/>
        <label for="firstname">*First Name</label>
    </div>
    <div class="form-floating mb-3">
        <input type="text" id="title" name="title"  placeholder="Pleas Enter Your Last Nmae" class="form-control" required/>
        <label for="lastname">*Last Name</label>
    </div>
    <div class="form-floating mb-3">
        <input type="email" id="email" name="email"  placeholder="Pleas Enter your Email Adress" class="form-control" required/ />
        <label for="title">*Email</label>
    </div>
    <div class="form-floating mb-3">
        <input type="text" id="password" name="password"  placeholder="Pleas Enter Your Password" class="form-control" required/ />
        <label for="password">*Password</label>
    </div>
    <div class="form-floating mb-3">
        <input type="text" id="confirmpassword"  placeholder="Pleas Confirm Your Password" class="form-control" required/ />
        <label for="confirmpassword">*Confirm Password</label>
    </div>
    <div>
        <button type="button" class="btn btn-warning" onclick="validateNewAccount()"> Make New Account</button>
        <input type="submit" id="submitPage" style="display:none"/>
    </div>  
</form>