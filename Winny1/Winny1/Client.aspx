<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="Winny1.Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><asp:Label ID="WpgCoupons" runat="server" Text="Winnipeg Coupons"></asp:Label></h1>
        <asp:DataList ID="dlCouponOrder"  DataKeyField="CouponId" RepeatColumns="3"
            runat="server"  OnSelectedIndexChanged="dlCouponOrder_SelectedIndexChanged" OnItemCommand="dlCouponOrder_ItemCommand">
        <ItemTemplate>
            <div class="review">
                <asp:Image ID="ImgCoupons" runat="server"
                    ImageUrl='<%# Eval("Path") %>'
                    Height="300px" Width="300px" />
                <br />              
                '<%# Eval("CouponName") %><br /><asp:DropDownList ID="ddlNumofCoupons" runat="server">
                    <asp:listitem Value="1" Selected="True">1</asp:listitem>
                    <asp:listitem Value="2">2</asp:listitem>
                    <asp:listitem Value="3">3</asp:listitem>
                </asp:DropDownList>
                <asp:Button ID="btnGetCoupon" runat="server" Text="Get Coupon"
                commandArgument='<%# Eval("CouponId") %>'/>
            </div>
           
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
