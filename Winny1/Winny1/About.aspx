<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Winny1.About1" %>
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
    object-fit: scale-down;
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

tr {
    height: 15px;
}
</style>

<asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px; align-self: center; " runat="server">
    
    <table>
        <tr>
            <td style="padding: 15px;">
                <asp:Label ID="lblAboutTopic" runat="server" Text="Learn About Us" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DdlAboutTopic" runat="server" Height="23px" Width="250px" BackColor="White"></asp:DropDownList>
            </td>
        </tr>
    </table>

    <asp:DataList ID="DlAbout" DataKeyField="AboutID" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" >
        <ItemTemplate>
            <div class="About" style="width:650px; align-self: center;"  onclick="return ViewAbout(<%#Eval("AboutID") %>)" >

            <table style="border-bottom-style: solid; width: 100%">
                <tr>
                    <td colspan="2" style="text-align: center; color:red; font-weight:bold;">
                        <%#Eval ("AboutTitle")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%#Eval ("AboutDescription")%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            
</asp:Panel>

</asp:Content>
