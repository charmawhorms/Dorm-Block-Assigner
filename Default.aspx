<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sports_Day_Website.Default" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="author" content="Charma Whorms" />
    <meta name="author" content="Daniel Minto" />
    <meta name="keywords" content="Sports Day, Heart Trust NTA, StonyHill" />
    <link rel="icon" type="image/x-icon" href="favicon.jpg" />
    <title>Home</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Styles.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />

    <script>
        //This method is the JavaScript Section that Sets up the DIV to display the Alert
        function showAlert(MsgText, MsgType) {
            var sStyle;
            switch (MsgType) {
                case 'Warning':
                    sStyle = 'alert-warning';
                    break;
                case 'Success':
                    sStyle = 'alert-success';
                    break;
                case 'Error':
                    sStyle = 'alert-danger';
                    break;
                default:
                    sStyle = 'alert-success';
                    break;
            }
            //This script is the actual jQuery code that translates the script
            $('#alert').append('<div id="alert" style="margin: 0 0.5%; -webkit-box-shadow:3px 4px 6px #999;" class="alert fade in '
                + sStyle + '"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>'
                + MsgType + '!</strong><br/><span>'+ MsgText + '');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="nav-bar-container">
            <nav>
                <picture>
                    <source media="(min-width: 1000px)" srcset="https://www.heart-nsta.org/wp-content/uploads/heartnsta-logo.png" width="260" height="60" alt="HEART Logo" />
                    <source media="(min-width: 470px)" srcset="https://www.heart-nsta.org/wp-content/uploads/heartnsta-logo.png" width="260" height="60" alt="HEART Logo" />
                    <img src="https://yt3.ggpht.com/-8KV-YS8jSsw/AAAAAAAAAAI/AAAAAAAAAAA/IFLtWS9UdRU/s900-c-k-no-mo-rj-c0xffffff/photo.jpg" width="70" height="60" alt="HEART Logo" />
                </picture>
                <div class="nav-bar-title">
                    <span>|</span>
                    <p>Sports House Randomizer</p>
                </div>
            </nav>
        </div>

        <div class="form-container">
            <div class="alert_message" id="alert">

            </div>
            <h1>Complete the form below</h1>
            <div class="form" runat="server">
                <div class="name">
                    <div class="fName">
                        <asp:Label ID="lblFirstName" Text="First Name" runat="server"></asp:Label>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFName" runat="server" ForeColor="Red" ErrorMessage="<strong>* Required</strong>" ControlToValidate="txtFirstName" />
                    </div>

                    <div class="lName">
                        <asp:Label ID="lblLastName" Text="Last Name" runat="server"></asp:Label>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLName" runat="server" ForeColor="Red" ErrorMessage="<strong>* Required</strong>" ControlToValidate="txtLastName" />
                    </div>
                </div>


                <asp:Label ID="lblEmail" Text="Email" runat="server" /> <br />
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="Red" ErrorMessage="<strong>* Required</strong>" ControlToValidate="txtEmail" /> <br />



                <asp:Label ID="lblGender" Text="Gender" runat="server" /> <br />
                <asp:RadioButton ID="radMale" GroupName="RadGroupGender" Text="Male" runat="server" />
                <asp:RadioButton ID="radFemale" GroupName="RadGroupGender" Text="Female" runat="server" /> <br />



                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btnSubmit" OnClick="btnSubmit_Click" /> <br /> <br />



                <asp:Label ID="lblConnection" runat="server" Text=""></asp:Label> <br />
                <asp:Label ID="lblResults" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
        <footer>
            &copy; Copyright 2023. Sports House Randomizer. All Rights Reserved.
        </footer>
    </form>
</body>
</html>
