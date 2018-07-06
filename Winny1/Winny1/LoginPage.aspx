<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Winny1.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%-- <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server"
           DisplayMode="List" BorderStyle="solid" BorderColor="Red" Width="250px"/>
    
<%--    Login & Validation--%>
    <div class="float_l">
    <h1><asp:Label ID="lblLogin" runat="server" Text="Login"></asp:Label> </h1>
    <table>
        <tr>
            <td>User Email</td>
            <td>
                <asp:TextBox ID="txtUserEmail" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="valReqUser" runat="server"
                   ControlToValidate="txtUserEmail"
                    Text="*Email is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td><strong>Password</strong></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valReqPassword" runat="server"
                  ControlToValidate="txtPassword"
                    Text="*Password is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    <br />
     <asp:Label ID="lblMessage" runat="server" ></asp:Label>
   <%-- CSS--%>
    <style>
        td{
            color:gold;
        }
        .topright {
            position: absolute;
            top: 8px;
            right: 16px;
            font-size: 18px;
        }
    #float_r{
        vertical-align:top;
            }

    </style>
    </div>
<%--    Registration--%>
        <div class="float_r">
    <h1><asp:Label ID="lblRegistration" runat="server" Text="Create an Account"></asp:Label></h1>
            <asp:Label ID="lblNewAccount" runat="server" Text=""></asp:Label>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                DisplayMode="List" BorderStyle="Dashed" BorderColor="Red" Width="250px" />
    <table>
        <tr>
            <td>First Name</td>
            <td>
                <asp:TextBox ID="txtNewFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valReqFirstName" runat="server"
                    ControlToValidate="txtNewFirstName" EnableClientScript="false" 
                    Text="*First Name is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <asp:TextBox ID="txtNewLastName" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="valReqLastName" runat="server"
                    ControlToValidate="txtNewLastName" EnableClientScript="false" 
                    Text="*Last Name is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>  
        <tr>
            <td>Phone Number</td>
            <td>
                <asp:TextBox ID="txtNewPhoneNumber" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="valReqPhoneNumber" runat="server"
                    ControlToValidate="txtNewPhoneNumber" EnableClientScript="false" 
                    Text="*Phone Number is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
                
            </td>
        </tr> 
        <tr>
            <td>Address</td>
            <td>
                <asp:TextBox ID="txtNewAddress" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="valReqAddress" runat="server"
                    ControlToValidate="txtNewAddress" EnableClientScript="false" 
                    Text="*Address is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>  
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtNewEmail" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="valReqEmail" runat="server"
                    ControlToValidate="txtNewEmail" EnableClientScript="false" 
                    Text="*Email is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>    
        <tr>
               <td>Choose Password</td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtNewPassword" EnableClientScript="false" 
                    Text="* Password is Required"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>   
        <tr>
            <td> Access Level</td>
            <td>
                <asp:TextBox ID="txtAccessLevel" runat="server" Enabled="false">c</asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
</div>
   

</asp:Content>
