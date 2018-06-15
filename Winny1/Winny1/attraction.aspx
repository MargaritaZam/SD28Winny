<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Winny1.attraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script src="Scripts/jquery-3.3.1.js"></script>
    <style>
        #div
       {
           cursor:pointer;

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
            <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" OnClick="btnSearch_Click" />
        </td>
    </tr>
</table>
        <asp:DataList ID="dlAttraction"  runat="server">
       <ItemTemplate>
            <div id="div" onclick="return ViewProduct(<%#Eval ("attractionID")%>)"  style="width:100%" >         
 
    <table >
     <tr>
     <td>
      <asp:Image ID="Image1"  runat="server" Height="200px" ImageUrl='<%# Bind("image") %>' Width="200px" />
     </td>
   <td >   
<table>
    <tr>
        <th style="text-decoration:underline; color:cornflowerblue"> <%#Eval ("atName")%></th></tr>     
       <tr><td style="width:50%">Description: <%#Eval ("atDesc")%></td></tr>
             <tr><td>Address: <%#Eval ("atAddress")%></td></tr>
             <tr><td>Phone: <%#Eval ("atPhone")%></td></tr>
             <tr><td>Website: <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval ("Website") %>' Text='<%# Eval ("Website") %>'></asp:HyperLink></td></tr>
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
    <script>
            function ViewProduct(id)
            {
                window.location = "attraction.aspx?id="+id;
            }
        </script>
   
        
</asp:Content>
