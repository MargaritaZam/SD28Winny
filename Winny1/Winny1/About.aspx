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

<asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px " runat="server">
    
    <table>
        <tr>
            <td>
                <asp:Label ID="lblAboutTitle" runat="server" Text="Title" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
            <td>
                    <asp:Label ID="lblAboutDescription" runat="server" Text="Description" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                    <asp:DropDownList ID="ddlAboutTitle" runat="server" Height="23px" Width="263px" BackColor="White"></asp:DropDownList>
            </td>
            <td>
                    <asp:DropDownList ID="ddlAboutDescription"  runat="server" Height="23px" Width="268px" BackColor="White"></asp:DropDownList>
            </td>
        </tr>
    </table>
    
    <asp:DataList ID="DlAbout" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" >
        <ItemTemplate>
            <div id="AboutDiv"  onclick="return ViewProduct(<%#Eval ("AboutID")%>)"  style="height:380px;">
               
                <table style="border-bottom-style: solid">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <th>
                                        <%#Eval ("AboutTitle")%>
                                    </th>
                                </tr>     
                                <tr>
                                    <td>Description: <%#Eval ("AboutDescription")%></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>             
                      
            </div>
        </ItemTemplate>
    </asp:DataList>

</asp:Panel>

</asp:Content>
