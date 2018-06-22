<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Winnipeg.aspx.cs" Inherits="Winny1.Winnipeg1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DropDownList ID="ddlAdditional" runat="server">
        <asp:ListItem>Attraction</asp:ListItem>
        <asp:ListItem>Restaurant</asp:ListItem>
        <asp:ListItem>Store</asp:ListItem>
        <asp:ListItem>Hotel</asp:ListItem>
        <asp:ListItem>School</asp:ListItem>
    </asp:DropDownList>
    <br />
    <table>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Description</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Address</td>
            <td>
                <asp:TextBox ID="Address" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Phone</td>
            <td>
                <asp:TextBox ID="Phone" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Website</td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink></td>
             </tr>
              <tr>
            <td>Image</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
              <tr>
            <td>Location</td>
            <td>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox></td>
        </tr>
        <asp:Panel ID="plAttraction" Visible="true" runat="server">
            <tr>
                <td>Category</td>
                <td>
                    <asp:TextBox ID="txtAttrCategory" runat="server"></asp:TextBox></td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plRestaurant" Visible="false" runat="server">
            <tr>
                <td>FoodType</td>
                <td>
                    <asp:TextBox ID="txtFoodTipe" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>PostalCode</td>
                <td>
                    <asp:TextBox ID="txtRestPostalCode" runat="server"></asp:TextBox></td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plHotel" Visible="false" runat="server">
            <tr>
                <td>PostalCode</td>
                <td>
                    <asp:TextBox ID="txtHotelPostal" runat="server"></asp:TextBox></td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plSchool" Visible="false" runat="server">
            <tr>
                <td>Type</td>
                <td>
                    <asp:TextBox ID="txtSchoolType" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>PostalCode</td>
                <td>
                    <asp:TextBox ID="txtSchoolPostalCode" runat="server"></asp:TextBox></td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="plStore" Visible="false" runat="server">
            <tr>
                <td>Category</td>
                <td>
                    <asp:TextBox ID="txtStoreCategory" runat="server"></asp:TextBox></td>
            </tr>
        </asp:Panel>
    </table>
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <asp:GridView ID="gvWinnipeg" runat="server"></asp:GridView>

</asp:Content>
