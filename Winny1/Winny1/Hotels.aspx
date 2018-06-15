<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="Winny1.Hotels1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PnlHotels" style="background-color:antiquewhite; width:800px "
        runat="server">
        <asp:DataList ID="DlHotels" DataKeyField="HotelID" RepeatColumns="1" runat="server">
            <ItemTemplate>
                <div id="TracysDiv" onclick="return ViewHotel(<%#Eval ("HotelID") %>)"
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>

</asp:Content>
