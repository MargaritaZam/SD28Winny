<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Winny1.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table id="product">
        <tr>
            <td>
               <asp:Image ID="imgRestaurant"  Width="350px" Height="400px" runat="server" />
                </td>
            <td style="vertical-align:top">
                <table>
                    <tr>
                        <td>Description</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="width:350px"><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtAmount" Width="30px"  Text="1"
                                ReadOnly="true" BorderWidth="1px"
                                BorderColor="#cccccc" runat="server"></asp:TextBox>
                            <asp:Button ID="bntAdd" runat="server" Height="20px" Text="+" OnClick="bntAdd_Click"  />
                            <asp:Button ID="btnSub" runat="server" Height="20px" Width="22px" Text="-" OnClick="btnSub_Click"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                            C$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnAddToCart" CssClass="btn"  runat="server"
                                Text="Add to cart" OnClick="btnAddToCart_Click"   />
                        </td>
                    </tr>
                </table>
            </td>
            </tr>
        </table>

</asp:Content>
