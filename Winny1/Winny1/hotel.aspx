<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hotel.aspx.cs" Inherits="Winny1.hotel" %>
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

table {
    border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
}

td {
  padding-right: 10px 0;
  margin-right: 20px;
}
 </style>

<asp:Panel ID="PnlHotels" style="background-color:antiquewhite; width:800px;" runat="server">

    <table>
        <tr>
            <td>
                <asp:Label ID="LblLocation" AutoPostBack="true" runat="server" Text="Browse by Location" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblHotelRating" AutoPostBack="true" runat="server" Text="Browse by Rating" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-right: 20px; margin-right: 20px;">
                <asp:DropDownList ID="DdlLocation" AutoPostBack="true" runat="server" Height="23px" Width="250px" BackColor="White"></asp:DropDownList>
            </td>
            <td style="padding-right: 20px; margin-right: 20px;">
                <asp:DropDownList ID="DdlHotelRating" AutoPostBack="true" runat="server" Height="23px" Width="250px" BackColor="White"></asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" OnClick="BtnSearch_Click" />
            </td>
        </tr>
    </table>

    <asp:DataList ID="DlHotels" DataKeyField="HotelID" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" CssClass="auto-style7">
        <ItemTemplate>
            <div class="Hotels" style="width: 700px;" onclick="return ViewHotel(<%#Eval("HotelID") %>)">
                
                <table>
                    <tr>
                        <td colspan="2" rowspan="9" style="padding: 10px;">
                            <asp:Image ID="ImgHotel" runat="server" ImageUrl='<%# Eval("Hotel_path") %>' />
                        </td>
                        <td colspan="3" style="text-align: center; color:red; font-weight:bold;">
                            <%# Eval("HotelName") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="color:black; text-align:left;" >
                            <%# Eval("HotelDescription") %>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:40%">
                            Rating: 
                        </td>
                        <td style="width:60%; color:black; text-align: left;">
                            <%# Eval ("HotelRating") %>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="width:40%">
                            Location: 
                        </td>
                        <td style="width:60%; color:black; text-align: left;">
                            <%# Eval ("LocationName") %>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            Price:
                        </td>
                        <td style="color:black; text-align: left;">
                            $<%# Eval ("HotelPrice") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone: 
                        </td>
                        <td style="color:black; text-align: left;">
                            <%# Eval ("HotelPhoneNumber") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address: 
                        </td>
                        <td style="color:black; text-align: left;">
                            <%# Eval ("HotelAddress") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postal Code: 
                        </td>
                        <td style="color:black; text-align: left;">
                            <%# Eval ("HotelPostalCode") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Website: 
                        </td>
                        <td colspan="2" style="color:black; text-align: left;">
                            <asp:HyperLink ID="HlHotel" runat="server" NavigateUrl='<%# Eval ("HotelWebsite") %>' Text='<%# Eval ("HotelWebsite") %>'></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <table>
      <tr>
        <td>
            <asp:Button ID="btnFirst" runat="server" Font-Bold="true" Text="First" 
                Height="31px" Width="65px" OnClick="btnFirst_Click" />
        </td>
        <td>
            <asp:Button ID="btnPrevious" runat="server" Font-Bold="true" Text="Previous" Height="31px" 
                    Width="65px" OnClick="btnPrevious_Click" />
        </td>
        <td>
            <asp:Button ID="btnNext" runat="server" Font-Bold="true" Text="Next" Height="31px" 
                Width="65px" OnClick="btnNext_Click"  />
        </td>
        <td>
            <asp:Button ID="btnLast" runat="server" Font-Bold="true" Text="Last" Height="31px" 
            Width="65px" OnClick="btnLast_Click"  />
        </td>
      </tr>
    </table> 

</asp:Panel>
</asp:Content>
