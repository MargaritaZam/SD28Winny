<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="Winny1.Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
        <div style="float:right; padding:50px; vertical-align:top">
                           <iframe  width="350" height="430" allow="microphone;"
    src="https://console.dialogflow.com/api-client/demo/embedded/4ba825dd-d3d3-4027-9f1a-ca69c00b07cb">
</iframe>
    </div>
    <h1><asp:Label ID="WpgCoupons" runat="server" Text="Winnipeg Coupons"></asp:Label></h1>
        <asp:DataList ID="dlCouponOrder"  DataKeyField="CouponId" RepeatColumns="3"
            runat="server"  OnSelectedIndexChanged="dlCouponOrder_SelectedIndexChanged" OnItemCommand="dlCouponOrder_ItemCommand">
        <ItemTemplate>
            <div class="review" style="float:left; color:gold;font-size:15px; font-family:Arial, Helvetica, sans-serif;">
                <asp:Image ID="ImgCoupons" runat="server"
                    ImageUrl='<%# Eval("Path") %>'
                    Height="200px" Width="200px" />
                <br />              
                <%# Eval("CouponName") %><br /><asp:DropDownList ID="ddlNumofCoupons" runat="server">
                    <asp:listitem Value="1" Selected="True">1</asp:listitem>
                    <%--<asp:listitem Value="2">2</asp:listitem>
                    <asp:listitem Value="3">3</asp:listitem>--%>
                </asp:DropDownList>
                <asp:Button ID="btnGetCoupon" runat="server" Text="Get Coupon"
                commandArgument='<%# Eval("CouponId") %>'/>
            </div>  
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
