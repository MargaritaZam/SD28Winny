﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Winny1.About1" %>
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
table {
    margin-left: 25px;
    border-spacing: 10px;
}

tr {
    height: 20px;
}
</style>

<asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px; align-self: center; " runat="server">
   
    <asp:DataList ID="DlAbout" DataKeyField="AboutID" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" >
        <ItemTemplate>
            <div class="About" style="width:650px; align-self: center;"  onclick="return ViewAbout(<%#Eval("AboutID") %>)" >

                <table style="border-bottom-style: solid; width: 100%">
                    <tr>
                        <td colspan="1" style="width: 100px; text-align: center; color:red; font-weight:bold;">
                            <%#Eval ("AboutTopic")%>
                        </td>
                        <td  colspan="2" style="color:black; text-align:left;">
                            <%#Eval ("AboutDescription")%>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:DataList ID="DlTemp" DataKeyField="MonthID" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" >
        <ItemTemplate>
            <div class="AvgTemp" style="width:300px; align-self: center;"  onclick="return ViewTemp(<%#Eval("MonthID") %>)" >
            <table style="padding: 15px;">
                <tr>
                    <td style="width: 100px; text-align: center; color:red; font-weight:bold;">
                        <%# Eval ("Month")%>
                    </td>
                    <td colspan="2" style="width: 100px; text-align: center; color:black; font-weight:normal;">
                        <%# Eval ("AvgHigh") %>
                    </td>
                    <td style="width: 100px; text-align: center; color:black; font-weight:normal;">
                        <%# Eval ("AvgLow") %>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>

    <table>
      <tr>
        <td>
            <asp:Button ID="BtnFirst" runat="server" Font-Bold="true" Text="First" 
                Height="31px" Width="65px" OnClick="BtnFirst_Click" />
        </td>
        <td>
            <asp:Button ID="BtnPrevious" runat="server" Font-Bold="true" Text="Previous" Height="31px" 
                    Width="65px" OnClick="BtnPrevious_Click"/>
        </td>
        <td>
            <asp:Button ID="BtnNext" runat="server" Font-Bold="true" Text="Next" Height="31px" 
                Width="65px" OnClick="BtnNext_Click"/>
        </td>
        <td>
            <asp:Button ID="BtnLast" runat="server" Font-Bold="true" Text="Last" Height="31px" 
            Width="65px" OnClick="BtnLast_Click"/>
        </td>
      </tr>
    </table> 
            
</asp:Panel>

</asp:Content>
