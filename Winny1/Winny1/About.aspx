<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Winny1.About1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PnlAbout" style="background-color:antiquewhite; width:800px " runat="server">
        <asp:DataList ID="DlAbout" DataKeyField="AboutID" RepeatColumns="1" runat="server">
            <ItemTemplate>
                <div id="AboutDiv" style="width:100%;">
                    <table>
                        <tr>
                            <th>Title:  <%# Eval("AboutTitle") %>'</th>  
                        </tr>
                        <tr><td style="width:50%">
                            Description:   <%# Eval("AboutDescription") %>
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>

</asp:Content>
