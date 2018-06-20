<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Winny1.About1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px " runat="server">
        <asp:DropDownList ID="DdlAbout" runat="server" AutoPostBack="True">
            <asp:ListItem>Title</asp:ListItem>
            <asp:ListItem>Description</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>

</asp:Content>
