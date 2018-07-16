<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AvgTemps.aspx.cs" Inherits="Winny1.AvgTemps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
table {
    margin-left: 25px;
    border-spacing: 10px;
}

tr {
    height: 20px;
    padding-bottom: 10px;
}
    </style>

    <asp:Panel ID="PnlTemps" style="background-color:antiquewhite; width:800px; align-self: center; " runat="server">
        <asp:DataList ID="DlTemps" runat="server">
            <ItemTemplate>
                <div class="Temps" style="width:100px; align-self: center;"  onclick="return ViewTemps(<%#Eval("MonthID") %>)">
                    
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2" style="width: 75px; text-align: center; color:red; font-weight:bold;">
                                <%#Eval ("Month")%>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:black; text-align:center;">
                                <%#Eval ("AvgHigh")%>
                            </td>
                            <td style="color:black; text-align:center;">
                                <%#Eval ("AvgLow")%>
                            </td>
                        </tr>
                    </table>

                </div>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>

</asp:Content>
