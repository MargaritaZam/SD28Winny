<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Universities.aspx.cs" Inherits="Winny1.Universities1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
      .auto-style2 {
          height: 164px;
      }
      .auto-style3 {
          height: 248px;
      }
      .auto-style4 {
          height: 242px;
      }
      .auto-style5 {
          height: 97px;
      }
      .auto-style6 {
          width: 268px;
      }
</style>

<asp:Panel ID="PnlSchools" runat="server">
    
    <table>
        <tr>
            <td>
                <asp:Label ID="lblLocation" runat="server" Text="Browse by Location" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
            <td>
                    <asp:Label ID="lblTypeOfSchool" runat="server" Text="Browse by Type of School" ForeColor="Black" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                    <asp:DropDownList ID="ddlLocation" runat="server" Height="23px" Width="263px" BackColor="White"></asp:DropDownList>
            </td>
            <td>
                    <asp:DropDownList ID="ddlTypeOfSchool"  runat="server" Height="23px" Width="268px" BackColor="White"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblSearch" runat="server" Text="Search by Name" ForeColor="Black" Font-Bold="true" BackColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                    <asp:TextBox ID="txtSearch" runat="server" Height="26px" Width="258px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>

    <asp:DataList ID="dlSchools" RepeatColumns="3" RepeatDirection="Horizontal" runat="server">
        <ItemTemplate>
            <div id="SchoolDiv"  onclick="return ViewProduct(<%#Eval ("SchoolID")%>)"  style="height:380px;">
               
            <table style="border-bottom-style: solid">
                <tr>
                    <td>
                        <asp:Image  ID="Image1" Height="250px" Width="240px" runat="server"
                            ImageUrl='<%#Eval ("School_path") %>' />
                    </td>
                    <td>
                        <table>
                            <tr>
                                <th>
                                    <%#Eval ("SchoolName")%>
                                </th>
                            </tr>     
                            <tr>
                                <td>Description: <%#Eval ("Description")%></td>
                            </tr>
                            <tr>
                                <td>
                                    Website: <asp:HyperLink ID="UnivWeb" runat="server" NavigateUrl='<%# Eval ("SchoolWebsite") %>' Text='<%# Eval ("Web") %>'></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>             
                      
            </div>
        </ItemTemplate>
    </asp:DataList>

    <table>
      <tr>
        <td>
            <asp:Button ID="btnFirst" runat="server" Font-Bold="true" Text="First" 
                Height="31px" Width="65px" OnClick="btnFirst_Click" />
        </td>
        <td>
            <asp:Button ID="btnPrevious" runat="server" Font-Bold="true" Text="Previous" Height="31px" 
                    Width="65px" OnClick="btnPrevious_Click" />
        </td>
        <td>
            <asp:Button ID="btnNext" runat="server" Font-Bold="true" Text="Next" Height="31px" 
                Width="65px" OnClick="btnNext_Click"  />
        </td>
        <td>
            <asp:Button ID="btnLast" runat="server" Font-Bold="true" Text="Last" Height="31px" 
            Width="65px" OnClick="btnLast_Click"  />
        </td>
      </tr>
    </table> 

</asp:Panel>

</asp:Content>
