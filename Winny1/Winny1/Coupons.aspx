<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Coupons.aspx.cs" Inherits="Winny1.Coupons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlCouponOrder"  DataKeyField="CouponId" runat="server" OnItemCommand="dlCouponOrder_ItemCommand" OnSelectedIndexChanged="dlCouponOrder_SelectedIndexChanged">
        <ItemTemplate>
            <div class="review">
                <asp:Image ID="ImgCoupons" runat="server"
                    ImageUrl='<%# Eval("Path") %>'
                    Height="300px" Width="300px" />
                <br />              
                '<%# Eval("CouponName") %>
                <br />
                <asp:DropDownList ID="ddlNumofCoupons" runat="server">
                    <asp:listitem>1</asp:listitem>
                    <asp:listitem>2</asp:listitem>
                    <asp:listitem>3</asp:listitem>
                </asp:DropDownList>
                <asp:Button ID="btnGetCoupon" runat="server" Text="Get Coupon"
     commandArgument='<%# Eval("OrderId") %>'/>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
