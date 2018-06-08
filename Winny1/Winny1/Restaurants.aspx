<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="Winny1.Restaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <style>
div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
      .auto-style1 {
          margin-top: 0px;
      }
  </style>

    <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1" Height="465px" Width="763px">
<div class="gallery">
  <a target="_blank" href="images/a6.jpg">
    <img src="images/a6.jpg"  width="300" height="200">
  </a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


<div class="gallery">
  <a target="_blank" href="images/a1.jpg">
    <img src="images/a1.jpg"  width="300" height="200">
  </a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


<div class="gallery">
  <a target="_blank" href="images/a2.jpg">
    <img src="images/a2.jpg"  width="300" height="200">
  </a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

<div class="gallery">
  <a target="_blank" href="images/a2.png">
    <img src="images/a2.png"  width="300" height="200">
  </a>
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

    <div class="gallery">
  <a target="_blank" href="images/a3.jpg">
    <img src="images/a3.jpg" width="300" height="200">
  </a>
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <asp:Button ID="btnLoadMore" runat="server" Text="Load more Photoes" BackColor="#CC0099" ForeColor="White" Height="43px" Width="760px" />

        </asp:Panel>
   

    <asp:RadioButtonList ID="rdChoice" runat="server"  Font-Size="X-Large" eColor="Black" Font-Bold="True" RepeatDirection="Horizontal" ForeColor="Black" CellSpacing="10" CellPadding="10" Width="759px">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>0-9</asp:ListItem>
        <asp:ListItem>A-F</asp:ListItem>
        <asp:ListItem>G-L</asp:ListItem>
        <asp:ListItem>M-R</asp:ListItem>
        <asp:ListItem>S-Z</asp:ListItem>

    </asp:RadioButtonList>

</asp:Content>
