<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="Winny1.info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/jquery-3.3.1.js"></script>

    <table>
        <tr>
            <td>
                <asp:Image ID="Image" Width="300px" Height="350px" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Name: 
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>           
                <td>Description: </td>
            <td>
                <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Phone: </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Address: </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Website: </td>
            <td>
                <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval ("Website") %>' Text='<%# Eval ("Website") %>'></asp:HyperLink></td>
        </tr>
    </table>
</asp:Content>
