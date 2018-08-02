<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CouponOrder.aspx.cs" Inherits="Winny1.CouponOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        a{
            font-size:20px;
            color:gold;
            font-style:italic;
        }
    </style>
       <div class="review" style="color:gold">
           <h1>Enjoy your deal!</h1>
         <asp:Image ID="ImgCoupons" runat="server" Height="250px" Width="250px"/>
         <br />
         <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>   
    </div>
    <a titlt="print screen" alt="print screen" onclick="window.print();"target="_blank" style="cursor:pointer;"><strong>Print coupon</strong></a>
</asp:Content>
