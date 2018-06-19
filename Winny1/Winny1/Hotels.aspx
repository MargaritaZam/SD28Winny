<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="Winny1.Hotels1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PnlHotels" style="background-color:antiquewhite; width:800px "
        runat="server">
        <asp:DataList ID="DlHotels" DataKeyField="HotelID" RepeatColumns="1" runat="server">
            <ItemTemplate>
                <div id="HotelDiv" style="width:100%;" onclick="return ViewHotel(<%#Eval ("HotelID") %>)">
                    <table>
                    <tr>
                        <td>
                            <asp:Image ID="ImgHotel"  Height="200px" Width="200px" runat="server"
                                ImageUrl='<%# Eval("Hotel_path") %>'/>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <th>Hotel Name:  <%# Eval("HotelName") %>'</th> 
                                </tr>
                                <tr>
                                    <td>
                                        Price: <%# Eval ("HotelPrice") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Number of Stars: <%# Eval ("HotelStars") %>
                                    </td>
                                </tr>
                                <tr><td style="width:50%">
                                        Description:   <%# Eval("HotelDescription") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Phone: <%# Eval ("HotelPhoneNumber") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Address: <%# Eval ("HotelAddress") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Website: <asp:HyperLink ID="hplWeb" runat="server" NavigateUrl='<%# Eval ("HotelWebsite") %>' Text='<%# Eval ("Web") %>'></asp:HyperLink>
                                    </td>
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
