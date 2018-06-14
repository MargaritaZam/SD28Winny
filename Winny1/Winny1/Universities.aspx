<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Universities.aspx.cs" Inherits="Winny1.Universities1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DlSchools" DataKeyField="SchoolID" RepeatColumns="5"
        runat="server">
        <ItemTemplate>
            <div class="UniversitiesColleges">
                <asp:Image ID="ImgSchool" runat="server" 
                    ImageUrl='<%# Eval("School_path") %>' 
                    ToolTip='<%# Eval("SchoolDescription") %>' />
                <br />
                <%# Eval("SchoolName") %>
                <br />
                <%# Eval("SchoolWebsite") %>
                <br />
                <%# Eval("SchoolPhoneNumber") %>
                <br />
                <%# Eval("SchoolAddress") %>
                <br />
                <%# Eval("SchoolPostalCode") %>
                <br />
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
