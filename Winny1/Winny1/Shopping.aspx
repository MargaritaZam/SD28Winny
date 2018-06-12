<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Winny1.Shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlStores" DataKeyField="StoreId" RepeatColumns="4"
        runat="server">
        <ItemTemplate>
            <div class="review">
                <asp:Image ID="ImgStore" runat="server"
                    ImageUrl='<%# Eval("Path") %>'
                    ToolTip='<%# Eval("Description") %>'
                    Height="200px" Width="200px"
                    />
                <br />
                '<%# Eval("StoreName") %>'
                <br />
            </div>
        </ItemTemplate>
    </asp:DataList>
 <%--   <table>
        <tr>
            <td>
                <asp:Button ID="btnAntiques" runat="server" Text="Antiques" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnBookStores" runat="server" Text="Book Stores" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnBoutiques" runat="server" Text="Boutiques" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnOutlets" runat="server" Text="Outlets" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnGourmetFoods" runat="server" Text="Gourmet Foods" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnShoppingMalls" runat="server" Text="Shopping Malls" BorderColor="#FF6600" BorderStyle="Double" BackColor="#99FF66" />
            </td>
        </tr>
    </table>--%>
</asp:Content>

