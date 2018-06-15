<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="Winny1.info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script src="Scripts/jquery-3.3.1.js"></script>


    <table>
        <tr>
            <td>
                <asp:Image ID="ImageInfo" Width="250px" Height="250px" runat="server" />
            </td>
            <td style="vertical-align: top">
                <table>
                    <tr>                   
                        <td style="width: 400px">
                        <asp:Label ID="lbName" runat="server" Text=""></asp:Label></td>
                    </tr>

                    <tr>
                        <td>Description: </td>
                        <td style="width: 400px">
                        <asp:Label ID="lbDesc" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Phone: </td>
                        <td style="width: 400px">
                        <asp:Label ID="lbPhone" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Address: </td>
                        <td style="width: 400px">
                        <asp:Label ID="lbAddress" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Website: </td>
                        <td>
                        <asp:HyperLink ID="hlWeb" runat="server" NavigateUrl='<%# Eval ("atWebsite") %>' Text='<%# Eval ("atWebsite") %>'></asp:HyperLink></td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>

</asp:Content>
