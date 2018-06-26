<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminpage.aspx.cs" Inherits="Winny1.Adminpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .adm {
            background-color: aliceblue;
            height: 2000px;
        }
        .l{
           font-size:40px;
           font-family:'Times New Roman', Times, serif;
        }
       
    </style>
    <asp:Panel ID="plAdmin" runat="server" CssClass="adm">
       
        <asp:LinkButton ID="LinkButton1" CssClass="l" runat="server" OnClick="LinkButton1_Click">#Restaurants</asp:LinkButton>

         <br />
         <br />
        <br />
        <asp:GridView ID="gvRestaurants" runat="server" Visible="false" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="RestaurantId" DataSourceID="SqlDataSource1"
            ForeColor="#333333" GridLines="None"
            PageSize="5" AllowPaging="True" AllowSorting="True"
            OnPageIndexChanging="gvRestaurants_PageIndexChanging"
            OnRowCommand="gvRestaurants_RowCommand"
            OnSelectedIndexChanging="gvRestaurants_SelectedIndexChanging" 
            OnSorting="gvRestaurants_Sorting" OnSelectedIndexChanged="gvRestaurants_SelectedIndexChanged">


            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="RestaurantId" HeaderText="RestaurantId" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantId" />
                <asp:BoundField DataField="RestaurantName" HeaderText="RestaurantName" SortExpression="RestaurantName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
                <asp:BoundField DataField="path" HeaderText="path" SortExpression="path" />
                <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                <asp:BoundField DataField="FoodId" HeaderText="FoodId" SortExpression="FoodId" />
                <asp:BoundField DataField="LocationId" HeaderText="LocationId" SortExpression="LocationId" />


                <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" ShowHeader="True" Text="Del" />
                <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Update" ShowHeader="True" Text="Upd" />


            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />


        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [RestaurantId], [RestaurantName], [Description], [Address], [PostalCode], [ContactNo], [path], [Website], [FoodId], [LocationId] FROM [tbRestaurants]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnInsertRestaurant" runat="server" Text="Insert" OnClick="btnInsertRestaurant_Click" />
        <asp:Label ID="lblRest" runat="server" Text=""></asp:Label>
        <asp:Panel ID="plUpdRest" runat="server" Visible="false">
<table>
    <tr>
        <td>RestNAme</td>
        <td>
            <asp:TextBox ID="txtRname" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>RestDescription</td>
        <td>
            <asp:TextBox ID="txtRDesc" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>RestAddress</td>
        <td>
            <asp:TextBox ID="txtRAddress" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>PostalCode</td>
        <td>
            <asp:TextBox ID="txtRPostal" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>RestPhone</td>
        <td>
            <asp:TextBox ID="txtRPhone" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>RestImage</td>
        <td>
            <asp:FileUpload ID="flRestImage" runat="server" /></td>
    </tr>
    <tr>
        <td>RestWebsite</td>
        <td>
            <asp:HyperLink ID="hlRest" runat="server">HyperLink</asp:HyperLink></td>
    </tr>
    <tr>
        <td>FoodCategory</td>
        <td>
            <asp:DropDownList ID="dlFood" runat="server" OnSelectedIndexChanged="dlFood_SelectedIndexChanged"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>Location</td>
        <td>
            <asp:DropDownList ID="dlLoc" runat="server" OnSelectedIndexChanged="dlLoc_SelectedIndexChanged"></asp:DropDownList></td>
    </tr>
   
</table>
            <asp:Button ID="btbRestSave" runat="server" Text="Save" OnClick="btbRestSave_Click" />
        </asp:Panel>








        <br />
        <br />

        <asp:LinkButton ID="LinkButton4" CssClass="l" runat="server">#Stores</asp:LinkButton>
        <br />
         <br />
         <br />
        <asp:GridView ID="gvShoping" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="StoreId" DataSourceID="SqlDataSource2" ForeColor="Black">

            <Columns>
                <asp:BoundField DataField="StoreId" HeaderText="StoreId" InsertVisible="False" ReadOnly="True" SortExpression="StoreId" />
                <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Web" HeaderText="Web" SortExpression="Web" />
                <asp:BoundField DataField="LocationId" HeaderText="LocationId" SortExpression="LocationId" />
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [StoreId], [StoreName], [Description], [Path], [Address], [PhoneNumber], [Web], [LocationId], [CategoryId] FROM [tbStores]"></asp:SqlDataSource>
        <br />




         <asp:LinkButton ID="LinkButton2" CssClass="l" runat="server">#Attractions</asp:LinkButton>
        <br />
         <br />
        <br />

        <asp:GridView ID="gvAttractions" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="attractionID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical">

            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="attractionID" HeaderText="attractionID" InsertVisible="False" ReadOnly="True" SortExpression="attractionID" />
                <asp:BoundField DataField="attractionCategory" HeaderText="attractionCategory" SortExpression="attractionCategory" />
                <asp:BoundField DataField="atName" HeaderText="atName" SortExpression="atName" />
                <asp:BoundField DataField="atDesc" HeaderText="atDesc" SortExpression="atDesc" />
                <asp:BoundField DataField="atAddress" HeaderText="atAddress" SortExpression="atAddress" />
                <asp:BoundField DataField="atPhone" HeaderText="atPhone" SortExpression="atPhone" />
                <asp:BoundField DataField="atWebsite" HeaderText="atWebsite" SortExpression="atWebsite" />
                <asp:BoundField DataField="atImage" HeaderText="atImage" SortExpression="atImage" />
                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [attractionID], [attractionCategory], [atName], [atDesc], [atAddress], [atPhone], [atWebsite], [atImage], [location] FROM [tbAttractions]"></asp:SqlDataSource>
        <br />
        <br />



        <asp:LinkButton ID="LinkButton5" CssClass="l" runat="server">#Hotels</asp:LinkButton>
        <br />
         <br />
         <br />
        <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID" DataSourceID="SqlDataSource4" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">

            <Columns>
                <asp:BoundField DataField="HotelID" HeaderText="HotelID" InsertVisible="False" ReadOnly="True" SortExpression="HotelID" />
                <asp:BoundField DataField="HotelName" HeaderText="HotelName" SortExpression="HotelName" />
                <asp:BoundField DataField="HotelPrice" HeaderText="HotelPrice" SortExpression="HotelPrice" />
                <asp:BoundField DataField="HotelStars" HeaderText="HotelStars" SortExpression="HotelStars" />
                <asp:BoundField DataField="HotelDescription" HeaderText="HotelDescription" SortExpression="HotelDescription" />
                <asp:BoundField DataField="HotelPhoneNumber" HeaderText="HotelPhoneNumber" SortExpression="HotelPhoneNumber" />
                <asp:BoundField DataField="HotelAddress" HeaderText="HotelAddress" SortExpression="HotelAddress" />
                <asp:BoundField DataField="HotelPostalCode" HeaderText="HotelPostalCode" SortExpression="HotelPostalCode" />
                <asp:BoundField DataField="HotelLocationID" HeaderText="HotelLocationID" SortExpression="HotelLocationID" />
                <asp:BoundField DataField="Hotel_path" HeaderText="Hotel_path" SortExpression="Hotel_path" />
                <asp:BoundField DataField="HotelWebsite" HeaderText="HotelWebsite" SortExpression="HotelWebsite" />
            </Columns>

            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [HotelID], [HotelName], [HotelPrice], [HotelStars], [HotelDescription], [HotelPhoneNumber], [HotelAddress], [HotelPostalCode], [HotelLocationID], [Hotel_path], [HotelWebsite] FROM [tbHotels]"></asp:SqlDataSource>

        <br />
        <br />


         <asp:LinkButton ID="LinkButton3" CssClass="l" runat="server">#Universities/Schools</asp:LinkButton>
        <br />
         <br />
        <br />
        <asp:GridView ID="gvUniversity" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SchoolID" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SchoolID" HeaderText="SchoolID" InsertVisible="False" ReadOnly="True" SortExpression="SchoolID" />
                <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName" />
                <asp:BoundField DataField="SchoolType" HeaderText="SchoolType" SortExpression="SchoolType" />
                <asp:BoundField DataField="SchoolPhoneNumber" HeaderText="SchoolPhoneNumber" SortExpression="SchoolPhoneNumber" />
                <asp:BoundField DataField="SchoolAddress" HeaderText="SchoolAddress" SortExpression="SchoolAddress" />
                <asp:BoundField DataField="SchoolPostalCode" HeaderText="SchoolPostalCode" SortExpression="SchoolPostalCode" />
                <asp:BoundField DataField="SchoolWebsite" HeaderText="SchoolWebsite" SortExpression="SchoolWebsite" />
                <asp:BoundField DataField="SchoolDescription" HeaderText="SchoolDescription" SortExpression="SchoolDescription" />
                <asp:BoundField DataField="School_path" HeaderText="School_path" SortExpression="School_path" />
                <asp:BoundField DataField="SchoolLocationID" HeaderText="SchoolLocationID" SortExpression="SchoolLocationID" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />

        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [SchoolID], [SchoolName], [SchoolType], [SchoolPhoneNumber], [SchoolAddress], [SchoolPostalCode], [SchoolWebsite], [SchoolDescription], [School_path], [SchoolLocationID] FROM [tbUniversitiesColleges]"></asp:SqlDataSource>

    </asp:Panel>
</asp:Content>
