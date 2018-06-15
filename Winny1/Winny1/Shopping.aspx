<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Winny1.Shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel  style="background-color:antiquewhite; width:800px " ID="pnlStores" runat="server">
    <asp:DataList ID="dlStores" DataKeyField="StoreId" RepeatColumns="1"
        runat="server">
        <ItemTemplate>
            <div id="mydiv"  onclick="return ViewProduct(<%#Eval ("StoreId")%>)"  style="width:100%;">
                <table>
                    <tr>
                        <td>
                <asp:Image ID="ImgStore"  Height="200px" Width="200px" runat="server"
                    ImageUrl='<%# Eval("Path") %>'/>
                    </td>
                        <td>
                            <table>
      <tr>
                <th>Store Name:  <%# Eval("StoreName") %>'</th>  
                        </tr>
                <tr><td style="width:50%">
                  Description:   <%# Eval("Description") %>
                    </td></tr>
                                <tr>
                                    <td>
                                        Address: <%# Eval ("Address") %>
                                    </td>
                                </tr>
                                   <tr>
                                    <td>
                                        Phone: <%# Eval ("PhoneNumber") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                   Website: <asp:HyperLink ID="hplWeb" runat="server" NavigateUrl='<%# Eval ("Web") %>' Text='<%# Eval ("Web") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
              </tr>            
               </table>
                 <style>
                    body{
                        color:darkblue;
                    }
                     img {
                 border: 1px solid #ddd;
                 border-radius: 4px;
                 padding: 5px;
                  width: 150px;
                  border-color:darkgreen;
                }
                </style>
            </div>
        </ItemTemplate>
    </asp:DataList>
        </asp:Panel>
</asp:Content>

