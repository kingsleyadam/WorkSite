<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WorkSite.login" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Productivity Home Page - Login</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Login ID="lgnView" runat="server" RenderOuterTable="false">
                <LayoutTemplate>

                    <div class="form-signin">
                        <h2 class="form-signin-heading">Please sign in</h2>
                        
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>

                        <label for="inputEmail" class="sr-only">Username</label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Username" autofocus="" type="username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="lgnView" CssClass="hidden">*</asp:RequiredFieldValidator>

                        <label for="inputPassword" class="sr-only">Password</label>
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" type="password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="lgnView" CssClass="hidden">*</asp:RequiredFieldValidator>
                        
                        <div class="checkbox">
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                        </div>

                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="lgnView" CssClass="btn btn-lg btn-primary btn-block" type="submit" />
                    </div>
                </LayoutTemplate>
            </asp:Login>

        </div>
    </form>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            CheckingSession();
        });
        function CheckingSession() {
            $.ajax({
                type: "POST",
                url: "services/UserStatus.asmx/LoggedIn",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: OnErrorCall
            });
            function OnSuccess(response) {
                if (response.d) {
                    alert('You are not logged in. Redirecting now.');
                    window.location.href = "/default.aspx";
                }
                else
                {
                    alert('You are not logged in.')
                }
            }
            function OnErrorCall(response) { console.log(error); }
        }
    </script>
</body>
</html>
