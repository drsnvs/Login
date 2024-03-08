<%-- 
    Document   : index
    Created on : Mar 6, 2024, 5:00:26 PM
    Author     : st
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <style>
            .main{
                text-align: center;
                border:2px solid black;
            }
            .table{
                margin: 5px;
                padding: 5px;
                display: inline-block;
                /*width: 500px;*/
            }
            #heading{
                margin:10px;
                padding:10px;
                font-size: 50px;
                font-weight:bold;
                background-color: silver;
                color:black;
            }
            .boxes{
                margin: 5px;
                padding: 5px;
                font-size: 25px; 
                text-align: left;
                
            }
            .button{
                margin: 5px;
                padding: 20px;
                
            }
            select{
                width: 200px;
                margin: 5px;
                padding: 5px;
            }
            input{
                width: 193px;
                height: 22px;
            }
            .center{
                text-align: center;
            }
            div{
                background-color:beige ;
                color: black;
                font-family:sans-serif;
            }
            #bt{
                font-weight:bold;
                background-color: silver;
                color:black;
            }
            textarea {
                resize:none;
                overflow: auto;
                min-width: 195px; 
                min-height: 100px; 
                max-width: 500px;
                max-height: 300px;
            }
        </style>
         
    </head>
    <body>
        <div class="main">
            <form name="registration" method="POST" action="loginServlet" onsubmit="return validateform()">
                <div id="heading">Registration</div>
                <table class="table" >
                    <tr>
                        <td class="boxes">Email</td>
                        <td class="boxes"><input type="email" name="email_id" id="email_id"></td>
                    </tr>
                    <tr>
                        <td class="boxes">Password</td>
                        <td class="boxes"><input type="password" name="password" id="password"></td>
                    </tr>
                    
                    
                    <tr>
                        <td class="boxes">Role</td>
                        <td>
                            <select name="role" required>
                                <option class="center" id="role" value=1>Admin</option>
                                <option class="center" id="role" value=2>User</option>
                                <option class="center" id="role" value=3>Guest</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button"><input id="bt" type="submit" value="Submit"></td>
                    </tr>
                </table>
            </form>
        </div>
        <script type="text/javascript">  
            function validateform(){  
                var first_name=document.getElementById("first_name").value;
                var last_name=document.getElementById("last_name").value;
                var password=document.getElementById("password").value;
                var c_password=document.getElementById("c_password").value;
                var email=document.getElementById("email_id").value;
                var mobile_no=document.getElementById("mobile_no").value;
                var address=document.getElementById("address").value;
                var letters = /^[A-Za-z]{6,20}$/;
                if (!first_name.match(letters)){
                    alert("Invalid First name");
                    return false;
                }
                if (!last_name.match(letters)){
                    alert("Invalid Formate in First name");
                    return false;
                }
                
                if(password === "" | password === null){
                    alert("Enter something in Password");
                    return false;
                }else if(password.length<6){
                    alert("Password should be more than 6");
                    return false;
                }
                
                if(c_password === "" | c_password === null){
                    alert("Enter something in Confirm Password");
                    return false;
                }else if(c_password.length<6){
                    alert("Length of Confirm Password should be greater than 6");
                    return false;
                }
                
                if(!(password === c_password)){
                    alert("Password and Confirm password is not same");
                    return false;
                }
                
                if (!email.match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
                    alert("Enter valid email address");
                    return false;
                }else if(email === "" | email === null){
                    alert("Email should be not null");
                    return false;
                }
                
                if (!/^[0-9]{10}$/.test(mobile_no)) {
                    alert("Enter valid mobile number");
                    return false;
                }
                
                if(address == "" | address == null){
                    alert("Enter something in Address");
                    return false;
                }
            }
        </script>
    </body>
</html>
