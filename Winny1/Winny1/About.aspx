<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Winny1.About1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px " runat="server">
    
    <asp:DataList ID="DlAbout" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" >
        <ItemTemplate>
               
            <table style="border-bottom-style: solid; width: 50%">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <th>
                                    <%#Eval ("AboutTitle")%>
                                </th>
                            </tr>
                            <tr>
                                <td><%#Eval ("AboutDescription")%></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            
</asp:Panel>

</asp:Content>
