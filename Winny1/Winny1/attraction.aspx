<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Winny1.attraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script src="Scripts/jquery-3.3.1.js"></script>
    <style>
        div
       {
           cursor:pointer;
           float:left;
             vertical-align:top;
       } 
        .Attr{
           background: linear-gradient(to right, white, aquamarine, blue);
          
        }
        .View{
            height:2000px;
            width:200px;
           
            vertical-align:top;
            background-color:cornflowerblue;
            float:right;
        }
            
    </style>
    <br />
    <br />

    <asp:Panel ID="Attr" runat="server"   Height="2500px" Width="1000px" BackColor="White"  >
        <br />
    <br />
     <br />
    <br />
<%--<table>
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
             <asp:DropDownList ID="ddlCategory" runat="server" Height="23px" Width="268px" BackColor="White">
                 <asp:ListItem>Museums</asp:ListItem>
                 <asp:ListItem>Galleies</asp:ListItem>
                 <asp:ListItem>Parks</asp:ListItem>
             </asp:DropDownList>
        </td>
    </tr>--%>
   <%-- <tr>
        <td>
            <asp:Label ID="lblSearch" runat="server" Text="Searh by Name" ForeColor="Black" Font-Bold="true" BackColor="White"></asp:Label>
        </td>
    </tr>--%>
   <%-- <tr>
        <td>
             <asp:TextBox ID="txtSearch" runat="server" Height="26px" Width="258px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" OnClick="btnSearch_Click" />
        </td>
    </tr>--%>
<%--</table>--%>
        <br />
        <br />
        <asp:DataList ID="dlAttraction" runat="server" CssClass="11">
       <ItemTemplate>
            <div id="div" onclick="return ViewProduct(<%#Eval ("attractionID")%>)"  style="width:100%" >         
 
    <table >
     <tr>
     <td>
      <asp:Image ID="Image1"  runat="server" Height="200px" ImageUrl='<%# Bind("atImage") %>' Width="200px" />
     </td>
   <td >   
<table>
    <tr>
        <th style="text-decoration:underline; color:cornflowerblue"> <%#Eval ("atName")%></th></tr>     
       <tr><td style="width:50%">Description: <%#Eval ("atDesc")%></td></tr>
             <tr><td>Address: <%#Eval ("atAddress")%></td></tr>
             <tr><td>Phone: <%#Eval ("atPhone")%></td></tr>
             <tr><td>Website: <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval ("atWebsite") %>' Text='<%# Eval ("atWebsite") %>'></asp:HyperLink></td></tr>
             <tr><td>Location: <%#Eval ("location")%></td></tr> 
   
</table>
       
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
   <%-- <div Class="View" style="display:inline-table">
        <table style="border: 2px solid blue; width:200px; height:200px"">
            <tr>
               <td></td>
            </tr>
        </table>
        <br />
        <br />
        <table style="border: 2px solid blue; width:200px; height:200px">
            <tr>
                <td><img src="Attractions/art-gallery.jpg" height="200" width="200" /></td>
            </tr>
        </table>
        <br />
        <br />
        <table style="border: 2px solid blue; width:200px; height:200px">
            <tr>
                <td><object data="http://impress.wag.ca/"></object>/</td>
            </tr>
        </table>
    </div>--%>
    <script>
            function ViewProduct(id)
            {
                window.location = "Information.html?id=" + id+"&choice="+"Attract";
            }
        </script>
   
        
</asp:Content>
