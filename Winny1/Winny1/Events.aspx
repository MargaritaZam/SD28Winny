<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Winny1.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       .dl{
           background-color:white;
       }
       a{
           font-size:20px;
           color:black;
           font-family:Arial;
           width:400px;
            text-align: center;
       }
       #dlEvents{
            border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
       }
       .dataList{
           border:double;
           border-color:gold;
            border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
       }
       #Image{
           border:5px solid gold;
           
       }
   </style>
     <div>
            <asp:RadioButtonList ID="rblEvents" AutoPostBack="true"
                RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="rblEvents_SelectedIndexChanged" >
                <asp:ListItem Value="f"  Text="Festivals"></asp:ListItem>
                <asp:ListItem Value="e"  Text="Exhibition"></asp:ListItem>
                <asp:ListItem Value="p"  Text="Plays"></asp:ListItem>              
            </asp:RadioButtonList>
        </div>
    <br />
    <asp:DataList ID="dlEvents" CssClass="dl" DataKeyField="eventID" RepeatColumns="1"
         runat="server" OnItemCommand="dlEvents_ItemCommand" OnSelectedIndexChanged="dlEvents_SelectedIndexChanged" >
<ItemTemplate>
    <div class="DataList">
        <asp:Image ID="Image"  runat="server" Width="250" Height="250"
            ImageUrl='<%#Eval("image") %>'/>
        <br />
         <a style="font-size:35px; font-style:italic; color:red;"><strong><%#Eval("name")%></strong></a>
                    <br />
        <br />
         <%-- <a ><%#Eval("type")%></a>
                    <br />--%>
          <a ><%#Eval("description")%></a>
                    <br />
         <a><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("website")%>'></asp:HyperLink></a>
                    <br />
         <a><%#Eval("date")%></a>
                    <br />
        <br />
        <br />
                    
    </div>
</ItemTemplate>
    </asp:DataList>
</asp:Content>
