<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewRestaurant.aspx.cs" Inherits="Winny1.ViewRestaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlRest"  runat="server">
       <ItemTemplate>
            
    <table >
     <tr>
     <td>
      <asp:Image ID="Image1"  runat="server" Height="200px" ImageUrl='<%# Bind("path") %>' Width="200px" />
     </td>
   <td >   
<table>
    <tr>
        <th> <%#Eval ("RestaurantName")%></th></tr>   
    <tr><td>Address: <%#Eval ("Address")%></td></tr>
             <tr><td>Phone: <%#Eval ("PostalCode")%></td></tr>
             <tr><td>Website: <%#Eval ("ContactNo")%></td></tr>
    <tr><td>Description: <%#Eval ("Description")%></td></tr>
     <tr><td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Website") %>' Text='<%# Eval("Website") %>'></asp:HyperLink></td></tr>
             
               
</table>
    </td>
</tr>
</table>
                 
                
           
       </ItemTemplate>
    </asp:DataList>


</asp:Content>
