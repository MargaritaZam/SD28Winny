<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Winny1.attraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #ul
        {
            margin: 0;
    padding: 0;
    overflow: hidden;
    border: 2px solid grey;
    height: 60px;
        }
        #li
        {
          float: left;
          border-right: 1px solid #bbb;
        }
        #li a
        {
            display: block;
        color: mediumvioletred;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        }
        #li a:hover:not(.active)
        {
        background-color:greenyellow;
        }
    li a.active
    {
        color:thistle;
        background-color:aquamarine;
    }
    </style>
   <h1>Welcome</h1>
    <br />
    
        <ul>
            <li style="float:left"><a href="museum.aspx">Museums</a></li>          
            <li style="float:left"><a href="galleries.aspx">Galleries</a></li>
            <li style="float:left"><a href="park.aspx">Parks</a></li>
        </ul>
    
        
</asp:Content>
