<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Winny1.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
.adm{
    background-color:aliceblue;
    height:2000px;
}
h1{
    color:darkcyan;
}


    </style>
    <asp:Panel ID="plAdmin" runat="server" CssClass="adm">
    <h1>Restaurants</h1>
    <br />
    <asp:GridView ID="gvRestaurants" runat="server">


    </asp:GridView>
    <br />
    <h1>Shoping</h1>
        <br />

    <asp:GridView ID="gvShoping" runat="server">

    </asp:GridView>
    <br />
    <h1>Attractions</h1>
        <br />

    <asp:GridView ID="gvAttractions" runat="server">

    </asp:GridView>
        <br />
    <br />
<h1>Hotels/Universities</h1>
        <br />
    <asp:GridView ID="gvHotels" runat="server">

    </asp:GridView>
    </asp:Panel>
</asp:Content>
