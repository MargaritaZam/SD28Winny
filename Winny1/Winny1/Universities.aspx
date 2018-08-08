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
    object-fit: scale-down;
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

table {
    border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
}

td {
  padding-right: 10px 0;
  margin-right: 20px;
}
</style>

<asp:Panel ID="PnlSchools" style="background-color:antiquewhite; width:800px;" runat="server">
    
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
                <asp:DropDownList ID="DdlLocation" AutoPostBack="true" runat="server" Height="23px" Width="250px" BackColor="White"></asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DdlTypeOfSchool" AutoPostBack="true" runat="server" Height="23px" Width="250px" BackColor="White"></asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" Text="Search" BackColor="#CC0099" Font-Bold="True" ForeColor="White" Height="33px" Width="80px" OnClick="BtnSearch_Click" />
            </td>
        </tr>
    </table>

    <asp:DataList ID="DlSchools" DataKeyField="SchoolID" RepeatColumns="1" RepeatDirection="Horizontal" runat="server" CssClass="auto-style7">
        <ItemTemplate>
            <div class="Schools" style="width:650px;"  onclick="return ViewSchool(<%#Eval("SchoolID") %>)" >
               
            <table>
                <tr>
                    <td colspan="2" rowspan="8" style="padding: 10px;" >
                        <asp:Image  ID="ImgSchool" runat="server" ImageUrl='<%# Eval("School_path") %>' />
                    </td>
                    <td colspan="3" style="text-align: center; color:red; font-weight:bold;" >
                        <%#Eval ("SchoolName")%>
                    </td>
                </tr>     
                <tr>
                    <td colspan="3" style="color:black; text-align:left;" >
                        <%#Eval ("SchoolDescription")%>
                    </td>
                </tr>
                    <tr>
                        <td>
                            Program Types:
                        </td>
                        <td style="color:black;">
                            <%# Eval ("SchType") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone: 
                        </td>
                        <td style="color:black;">
                            <%# Eval ("SchoolPhoneNumber") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address: 
                        </td>
                        <td style="color:black;">
                            <%# Eval ("SchoolAddress") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postal Code: 
                        </td>
                        <td style="color:black;">
                            <%# Eval ("SchoolPostalCode") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Website: 
                        </td>
                        <td colspan="2">
                            <asp:HyperLink ID="HyperLinkSchool" runat="server" NavigateUrl='<%# Eval ("SchoolWebsite") %>' Text='<%# Eval ("SchoolWebsite") %>' ></asp:HyperLink>
                        </td>
                    </tr>
                </table>             
                      
            </div>
        </ItemTemplate>
    </asp:DataList>

    <table>
      <tr>
        <td>
            <asp:Button ID="BtnFirst" runat="server" Font-Bold="true" Text="First" 
                Height="31px" Width="65px" OnClick="BtnFirst_Click" />
        </td>
        <td>
            <asp:Button ID="BtnPrevious" runat="server" Font-Bold="true" Text="Previous" Height="31px" 
                    Width="65px" OnClick="BtnPrevious_Click" />
        </td>
        <td>
            <asp:Button ID="BtnNext" runat="server" Font-Bold="true" Text="Next" Height="31px" 
                Width="65px" OnClick="BtnNext_Click"  />
        </td>
        <td>
            <asp:Button ID="BtnLast" runat="server" Font-Bold="true" Text="Last" Height="31px" 
            Width="65px" OnClick="BtnLast_Click"  />
        </td>
      </tr>
    </table> 

</asp:Panel>

</asp:Content>
