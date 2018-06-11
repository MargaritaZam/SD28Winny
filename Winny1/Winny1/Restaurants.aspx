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
      .auto-style2 {
          height: 164px;
      }
      .auto-style3 {
          height: 248px;
      }
      .auto-style4 {
          height: 242px;
      }
      .auto-style5 {
          height: 97px;
      }
      .auto-style6 {
          width: 268px;
      }
  </style>

    <asp:Panel ID="Panel1" runat="server"  Height="800px" Width="600px" BackColor="White">
<div class="gallery">
  <a target="_blank" href="images/a6.jpg">
    <img src="images/a6.jpg"  width="300" height="100%" class="auto-style2">
  </a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


<div class="gallery">
  <a target="_blank" href="images/a1.jpg">
    <img src="images/a1.jpg"  width="300" class="auto-style3">
  </a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


<div class="gallery">
  <a target="_blank" href="images/a2.jpg">
    <img src="images/a2.jpg"  width="300" class="auto-style4">
  </a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

<div class="gallery">
  <a target="_blank" href="images/a2.png">
    <img src="images/a2.png"  width="300" class="auto-style5">
  </a>
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

    <div class="gallery">
  <a target="_blank" href="images/a3.jpg">
    <img src="images/a3.jpg" width="300" height="200">
  </a>
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <asp:Button ID="btnLoadMore" runat="server" Text="Load more Photoes" BackColor="#CC0099" ForeColor="White" Height="43px" Width="602px" Font-Bold="True" />
         <asp:RadioButtonList ID="rdChoice" runat="server"  Font-Size="X-Large" eColor="Black" Font-Bold="True" RepeatDirection="Horizontal" ForeColor="Black" CellSpacing="10" CellPadding="10" Width="598px">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>0-9</asp:ListItem>
        <asp:ListItem>A-F</asp:ListItem>
        <asp:ListItem>G-L</asp:ListItem>
        <asp:ListItem>M-R</asp:ListItem>
        <asp:ListItem>S-Z</asp:ListItem>

    </asp:RadioButtonList>
<table>
    <tr>
        <td class="auto-style6">
            <asp:Label ID="lblLocation" runat="server" Text="Browse by Location" ForeColor="Black" Font-Bold="true"></asp:Label>
        </td>
        <td class="auto-style6">
             <asp:Label ID="lblCulinary" runat="server" Text="Browse by Culinary Type" ForeColor="Black" Font-Bold="true"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
             <asp:DropDownList ID="ddlLocation" runat="server" Height="23px" Width="263px" BackColor="White"></asp:DropDownList>
        </td>
        <td class="auto-style6">
             <asp:DropDownList ID="ddlCulinary" runat="server" Height="23px" Width="268px" BackColor="White"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblSearch" runat="server" Text="Searh by Name" ForeColor="Black" Font-Bold="true" BackColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
             <asp:TextBox ID="txtSearch" runat="server" Height="26px" Width="258px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" />
        </td>
    </tr>
</table>
        

          </asp:Panel>
   
   
</asp:Content>
