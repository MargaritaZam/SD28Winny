<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Winny1.attraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <style>
        .column {
            float: left;
            width: 33.33%;
            padding: 15px;
        }
    </style>
    <asp:Panel ID="Attr" runat="server"  Height="2000px" Width="600px" BackColor="White">
<table>
    <tr>
        <td>
            <asp:Label ID="lblLocation" runat="server" Text="Browse by Location" ForeColor="Black" Font-Bold="true"></asp:Label>
        </td>
        <td>
             <asp:Label ID="lblCategory" runat="server" Text="Browse by Category" ForeColor="Black" Font-Bold="true"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
             <asp:DropDownList ID="ddlLocation" runat="server" Height="23px" Width="263px" BackColor="White"></asp:DropDownList>
        </td>
        <td>
             <asp:DropDownList ID="ddlCategory" runat="server" Height="23px" Width="268px" BackColor="White"></asp:DropDownList>
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
        <asp:DataList ID="dlAttraction" DataKeyField="attractionCategory" RepeatColumns="1" RepeatDirection="Horizontal" runat="server">
       <ItemTemplate>
            <div id="mydiv" class="column"  onclick="return ViewProduct(<%#Eval ("attractionCategory")%>)"  style="height:380px; vertical-align:top">         



 <table style="width:100%">
<tr>
<td style="vertical-align:top; float:left; display:inline-block">
    <table1>
     <tr>
     <td style="height:250px"><asp:Image ID="Image1" runat="server" Height="230px" ImageUrl='<%# Bind("atImage") %>' Width="230px" /></td>
    </tr>
    </table1>
</td>
    <td style="vertical-align:top; float:right; display:inline-block">
<table2 >
    <tr>
        <td> <%#Eval ("atName")%><br />
             <%#Eval ("atDesc")%><br />
             <%#Eval ("atAddress")%><br />
             <%#Eval ("atPhone")%><br />
             <%#Eval ("atWebsite")%><br />
             <%#Eval ("location")%>
        </td>
    </tr>
</table2>
    </td>
</tr>
</table>
                 
                
            </div>
       </ItemTemplate>
    </asp:DataList>
        <br />
                <br />
                <br />
        <table>
  <tr>
    <td>
        <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="First" Height="31px" 
                    Width="43px" OnClick="btnfirst_Click"  /></td>
        <td>
            <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="Previous" Height="31px" 
                    Width="43px" OnClick="btnprevious_Click"  /></td>
            <td>
                <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text="Next" Height="31px" 
                    Width="43px" OnClick="btnnext_Click"  /></td>
                <td>
                    <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text="Last" Height="31px" 
                    Width="43px" OnClick="btnlast_Click"  /></td>
    </tr>
   </table>

          </asp:Panel>
   
        
</asp:Content>
