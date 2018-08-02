<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Winny1.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       
       table {
    border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
}

td {
  padding-right: 10px 0;
  margin-right: 20px;
}
       .dl{
           background-color:white;
       }
      
       #dlEvents{
            border-collapse: separate;
    border-spacing: 10px 0;
    margin-left: 25px;
       }
      
       #Image{
           width:250px;
           height:200px;
       }
     #rblEvents{
         font-size:25px;
         color:gold;
         font-style:italic;
     }
   </style>
     <div>
            <asp:RadioButtonList ID="rblEvents" AutoPostBack="true" Font-Italic="true" Font-Size="Large" ForeColor="gold" Font-Bold="true"
                RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="rblEvents_SelectedIndexChanged" >
                <asp:ListItem Value="f"   Text="Festivals"></asp:ListItem>
                <asp:ListItem Value="e"  Text="Exhibition"></asp:ListItem>
                <asp:ListItem Value="p"  Text="Plays"></asp:ListItem>              
            </asp:RadioButtonList>
        </div>
    <br />
    <asp:DataList ID="dlEvents" CssClass="dl" DataKeyField="eventID" RepeatColumns="1"
         runat="server" OnItemCommand="dlEvents_ItemCommand" OnSelectedIndexChanged="dlEvents_SelectedIndexChanged" >
    <ItemTemplate>
            <div class="Events" style="width: 900px;">
                
                <table>
                    <tr>
                        <td colspan="2" rowspan="9" style="padding: 10px; ">
                            <asp:Image  ID="Image" Width="250" Height="200"  runat="server" ImageUrl='<%# Eval("image") %>' />
                        </td>
                        <td colspan="3" style="text-align: center; color:red; font-weight:bold;"  >
                          <%# Eval("name") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="color:black; text-align:left; " >
                            <%# Eval("description") %>
                        </td>
                    </tr>
                   
                    <tr>
                       
                        <td colspan="2" style="color:black; text-align: left;">More details:
                            <asp:HyperLink ID="hlevent" runat="server" NavigateUrl='<%# Eval ("website") %>' Text='<%# Eval ("website") %>'></asp:HyperLink>
                        </td>
                    </tr>
                    <br />
                     <tr>
                        
                        <td style="color:green; text-align: left;">
                            <%# Eval ("date") %>
                        </td>
                    </tr>
                </table>
                 <br />
            </div>
 


</ItemTemplate>

    </asp:DataList>
    
</asp:Content>
