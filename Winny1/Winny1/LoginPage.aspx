<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Winny1.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server"
           DisplayMode="List" BorderStyle="solid" BorderColor="Red" Width="250px"/>
    
<%--    Login & Validation--%>
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
            <td>Password</td>
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
        .topright {
    position: absolute;
    top: 8px;
    right: 16px;
    font-size: 18px;
}
    </style>

</asp:Content>
