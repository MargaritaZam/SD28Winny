﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ADMIN.aspx.cs" Inherits="Winny1.ADMIN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        image {
            width: 150px;
            height: 150px;
        }

        .adm {
            background-color: aliceblue;
            height: 5000px;
        }

        .l {
            font-size: 20px;
            font-family: 'Times New Roman', Times, serif;
        }
    </style>
    <asp:Panel ID="plAdmin" runat="server" CssClass="adm">
        <h2 style="color: crimson"><strong>Report</strong></h2>

        <div>
            <asp:RadioButtonList ID="rblReport" AutoPostBack="true"
                RepeatDirection="Vertical" runat="server" OnSelectedIndexChanged="rblReport_SelectedIndexChanged">
                <asp:ListItem Value="f" Text="Users"></asp:ListItem>
                <asp:ListItem Value="i" Text="Wrong logins"></asp:ListItem>
                <asp:ListItem Value="at" Text="Attraction's qnt"></asp:ListItem>
                <asp:ListItem Value="st" Text="List of Shopping category"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div>
            <asp:GridView ID="gvreport" runat="server"></asp:GridView>
        </div>

        <br />
        <br />
       <%-- <h2><strong>List of Users</strong></h2>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowPaging="True"
            AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="gvUsers_SelectedIndexChanged">

            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                <asp:BoundField DataField="phoneNumber" HeaderText="phoneNumber" SortExpression="phoneNumber" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="accessLevel" HeaderText="accessLevel" SortExpression="accessLevel" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>"
            SelectCommand="SELECT [id], [firstName], [lastName], [phoneNumber], [address], [email], [password], [accessLevel] FROM [tbUsers] ORDER BY [lastName]"></asp:SqlDataSource>--%>

        <br />
        <br />
        <div>
            <asp:RadioButtonList ID="rblAdmin" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAdmin_SelectedIndexChanged">
                <asp:ListItem Value="R" Text="Restaurants"></asp:ListItem>
                <asp:ListItem Value="S" Text="Stores"></asp:ListItem>
                <asp:ListItem Value="A" Text="Attractions"></asp:ListItem>
                <asp:ListItem Value="H" Text="Hotels"></asp:ListItem>
                <asp:ListItem Value="E" Text="Events"></asp:ListItem>

            </asp:RadioButtonList>
        </div>
        <br />
        <br />
        <asp:Panel ID="panelRestaurants" runat="server" Visible="false">
            <h2><strong>Restaurants</strong></h2>
            <asp:GridView ID="gvRestaurants" runat="server" PageSize="3" Font-Size="smaller"
                CellPadding="3" DataKeyNames="RestaurantId" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False"
                OnPageIndexChanging="gvRestaurants_PageIndexChanging"
                OnRowCommand="gvRestaurants_RowCommand"
                OnSelectedIndexChanging="gvRestaurants_SelectedIndexChanging"
                OnSorting="gvRestaurants_Sorting" OnSelectedIndexChanged="gvRestaurants_SelectedIndexChanged"
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">


                <AlternatingRowStyle BackColor="#F7F7F7" />


                <Columns>
                    <asp:BoundField DataField="RestaurantId" HeaderText="RestaurantId" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantId" />
                    <asp:BoundField DataField="RestaurantName" HeaderText="RestaurantName" SortExpression="RestaurantName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
                    <asp:ImageField DataImageUrlField="path" HeaderText="path">
                    </asp:ImageField>
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                    <asp:BoundField DataField="FoodId" HeaderText="FoodId" SortExpression="FoodId" />
                    <asp:BoundField DataField="LocationId" HeaderText="LocationId" SortExpression="LocationId" />


                    <asp:ButtonField ButtonType="Button" CommandName="del" HeaderText="Delete" ShowHeader="True" Text="Del" />
                    <asp:ButtonField ButtonType="Button" CommandName="upd" HeaderText="Update" ShowHeader="True" Text="Upd" />


                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />


            </asp:GridView>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [RestaurantId], [RestaurantName], [Description], [Address], [PostalCode], [ContactNo], [path], [Website], [FoodId], [LocationId] FROM [tbRestaurants]"></asp:SqlDataSource>
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
                            <asp:TextBox ID="txtRWebsite" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>FoodCategory</td>
                        <td>
                            <asp:DropDownList ID="dlFood" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:DropDownList ID="dlLoc" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>

                </table>
                <asp:Button ID="btbRestSave" runat="server" Text="Save" OnClick="btbRestSave_Click" />
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="panelStores" runat="server" Visible="false">
            <h2>Stores</h2>
            <br />
            <br />
            <br />
            <asp:GridView ID="gvShoping" runat="server" PageSize="3" AutoGenerateColumns="False" AllowPaging="True" BackColor="White"
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="smaller"
                DataKeyNames="StoreId" OnPageIndexChanging="gvShoping_PageIndexChanging"
                OnRowCommand="gvShoping_RowCommand"
                OnSorting="gvShoping_Sorting" OnSelectedIndexChanged="gvShoping_SelectedIndexChanged" GridLines="Horizontal">

                <AlternatingRowStyle BackColor="#F7F7F7" />

                <Columns>
                    <asp:BoundField DataField="StoreId" HeaderText="StoreId" InsertVisible="False" ReadOnly="True" SortExpression="StoreId" />
                    <asp:BoundField DataField="StoreName" HeaderText="StoreName" SortExpression="StoreName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:ImageField DataImageUrlField="Path" HeaderText="Path">
                    </asp:ImageField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Web" HeaderText="Web" SortExpression="Web" />
                    <asp:BoundField DataField="LocationId" HeaderText="LocationId" SortExpression="LocationId" />
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
                    <asp:ButtonField ButtonType="Button" CommandName="Del" HeaderText="Delete" ShowHeader="True" Text="Del" />
                    <asp:ButtonField ButtonType="Button" CommandName="Upd" HeaderText="Update" ShowHeader="True" Text="Upd" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [StoreId], [StoreName], [Description], [Path], [Address], [PhoneNumber], [Web], [LocationId], [CategoryId] FROM [tbStores]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="btnStoreInsert" runat="server" Text="Insert" OnClick="btnStoreInsert_Click" />
            <asp:Label ID="lblStore" runat="server" Text=""></asp:Label>
            <asp:Panel ID="plUpdateStore" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>StoreName</td>
                        <td>
                            <asp:TextBox ID="txtStoreName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>StoreDescription</td>
                        <td>
                            <asp:TextBox ID="txtStoreDesc" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>StoreAddress</td>
                        <td>
                            <asp:TextBox ID="txtStoreAddress" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>StorePhone</td>
                        <td>
                            <asp:TextBox ID="txtStorePhone" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>StoreImage</td>
                        <td>
                            <asp:FileUpload ID="flStoreImage" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>StoreWebsite</td>
                        <td>
                            <asp:TextBox ID="txtStoreWeb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>StoreCategory</td>
                        <td>
                            <asp:DropDownList ID="ddlStoreCategory" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:DropDownList ID="ddlLoc" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>

                </table>
                <asp:Button ID="btnSavestore" runat="server" Text="Save" OnClick="btnSavestore_Click" />
            </asp:Panel>
        </asp:Panel>





        <asp:Panel ID="panelAttraction" runat="server" Visible="false">
            <h2>Attractions</h2>
            <br />
            <br />
            <br />

            <asp:GridView ID="gvAttractions" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" PageSize="3" Font-Size="smaller"
                BorderWidth="1px" CellPadding="3" DataKeyNames="attractionID" GridLines="Horizontal" OnRowCommand="gvAttractions_RowCommand"
                OnPageIndexChanging="gvAttractions_PageIndexChanging" OnSelectedIndexChanged="gvAttractions_SelectedIndexChanged"
                OnSorting="gvAttractions_Sorting">

                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="attractionID" HeaderText="attractionID" InsertVisible="False" ReadOnly="True" SortExpression="attractionID" />
                    <asp:BoundField DataField="attractionCategory" HeaderText="attractionCategory" SortExpression="attractionCategory" />
                    <asp:BoundField DataField="atName" HeaderText="atName" SortExpression="atName" />
                    <asp:BoundField DataField="atDesc" HeaderText="atDesc" SortExpression="atDesc" />
                    <asp:BoundField DataField="atAddress" HeaderText="atAddress" SortExpression="atAddress" />
                    <asp:BoundField DataField="atPhone" HeaderText="atPhone" SortExpression="atPhone" />
                    <asp:BoundField DataField="atWebsite" HeaderText="atWebsite" SortExpression="atWebsite" />
                    <asp:ImageField DataImageUrlField="atImage" HeaderText="atImage">
                    </asp:ImageField>
                    <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                    <asp:ButtonField ButtonType="Button" CommandName="del" HeaderText="del" ShowHeader="True" Text="Del" />
                    <asp:ButtonField ButtonType="Button" CommandName="upd" HeaderText="upd" ShowHeader="True" Text="Upd" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [attractionID], [attractionCategory], [atName], [atDesc], [atAddress], [atPhone], [atWebsite], [atImage], [location] FROM [tbAttractions]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="btnAttrInsert" runat="server" Text="Insert" OnClick="btnAttrInsert_Click" />
            <asp:Label ID="lblAttr" runat="server" Text=""></asp:Label>
            <asp:Panel ID="pnlUpdateAttr" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>AttrNAme</td>
                        <td>
                            <asp:TextBox ID="txtAttrName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>AttrDescription</td>
                        <td>
                            <asp:TextBox ID="txtAttrDesc" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>AttrAddress</td>
                        <td>
                            <asp:TextBox ID="txtAttrAddress" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>AttrPhone</td>
                        <td>
                            <asp:TextBox ID="txtAttrPhone" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>AttrImage</td>
                        <td>
                            <asp:FileUpload ID="flAttrImage" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>AttrWebsite</td>
                        <td>
                            <asp:TextBox ID="txtAttrWeb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>AttrCategory</td>
                        <td>
                            <asp:DropDownList ID="ddlAttrCategory" runat="server" AutoPostBack="true">
                                <asp:ListItem>Museums</asp:ListItem>
                                <asp:ListItem>Galleries</asp:ListItem>
                                <asp:ListItem>Parks</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:DropDownList ID="ddllocat" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>

                </table>
                <asp:Button ID="btnSaveAttr" runat="server" Text="Save" OnClick="btnSaveAttr_Click" />
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />


        <asp:Panel ID="panelHotel" runat="server" Visible="false">
            <h2>Hotels</h2>
            <br />
            <br />
            <br />
            <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" PageSize="3" Font-Size="smaller"
                DataKeyNames="HotelID" BackColor="White" AllowPaging="True" AllowSorting="True"
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                GridLines="Horizontal" OnSelectedIndexChanged="gvHotels_SelectedIndexChanged"
                OnPageIndexChanging="gvHotels_PageIndexChanging" OnRowCommand="gvHotels_RowCommand"
                OnSorting="gvHotels_Sorting">

                <AlternatingRowStyle BackColor="#F7F7F7" />

                <Columns>
                    <asp:BoundField DataField="HotelID" HeaderText="HotelID" InsertVisible="False" ReadOnly="True" SortExpression="HotelID" />
                    <asp:BoundField DataField="HotelName" HeaderText="HotelName" SortExpression="HotelName" />
                    <asp:BoundField DataField="HotelPrice" HeaderText="HotelPrice" SortExpression="HotelPrice" />
                    <asp:BoundField DataField="HotelRatingID" HeaderText="HotelRatingID" SortExpression="HotelRatingID" />
                    <asp:BoundField DataField="HotelDescription" HeaderText="HotelDescription" SortExpression="HotelDescription" />
                    <asp:BoundField DataField="HotelPhoneNumber" HeaderText="HotelPhoneNumber" SortExpression="HotelPhoneNumber" />
                    <asp:BoundField DataField="HotelAddress" HeaderText="HotelAddress" SortExpression="HotelAddress" />
                    <asp:BoundField DataField="HotelPostalCode" HeaderText="HotelPostalCode" SortExpression="HotelPostalCode" />
                    <asp:BoundField DataField="HotelLocationID" HeaderText="HotelLocationID" SortExpression="HotelLocationID" />
                    <asp:ImageField DataImageUrlField="Hotel_path" HeaderText="Hotel_path">
                    </asp:ImageField>
                    <asp:BoundField DataField="HotelWebsite" HeaderText="HotelWebsite" SortExpression="HotelWebsite" />
                    <asp:ButtonField ButtonType="Button" CommandName="DEL" HeaderText="Delete" ShowHeader="True" Text="Del" />
                    <asp:ButtonField ButtonType="Button" CommandName="UPD" HeaderText="Update" ShowHeader="True" Text="Upd" />
                </Columns>

                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [HotelID], [HotelName], [HotelPrice], [HotelRatingID], [HotelDescription], [HotelPhoneNumber], [HotelAddress], [HotelPostalCode], [HotelLocationID], [Hotel_path], [HotelWebsite] FROM [tbHotels]"></asp:SqlDataSource>

            <br />
            <br />
            <asp:Button ID="btnInsertHotel" runat="server" Text="Insert" OnClick="btnInsertHotel_Click" />
            <asp:Label ID="lblHotel" runat="server" Text=""></asp:Label>
            <asp:Panel ID="pnlUpdateHotel" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>HotelNAme</td>
                        <td>
                            <asp:TextBox ID="txtHotelName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelPrice</td>
                        <td>
                            <asp:TextBox ID="txtHotelPrice" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelRating</td>
                        <td>
                            <asp:TextBox ID="txtHotelRating" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelDesc</td>
                        <td>
                            <asp:TextBox ID="txtHotelDesc" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelAddress</td>
                        <td>
                            <asp:TextBox ID="txtHotelAddress" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>HotelPhone</td>
                        <td>
                            <asp:TextBox ID="txtHotelPhone" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelPostalCode</td>
                        <td>
                            <asp:TextBox ID="txtHotelPostal" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>HotelImage</td>
                        <td>
                            <asp:FileUpload ID="flHotelImage" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>HotelWebsite</td>
                        <td>
                            <asp:TextBox ID="txtHotelWeb" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Location</td>
                        <td>
                            <asp:DropDownList ID="ddlHotelLoc" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>

                </table>
                <asp:Button ID="btnSaveHotel" runat="server" Text="Save" OnClick="btnSaveHotel_Click" />
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="pnlNew" Visible="false" runat="server" BackColor="WhiteSmoke">
            <br />
            <asp:Panel ID="pnlInsertEvents" runat="server" Visible="false">
                <asp:Button ID="btnIns" runat="server" Text="New" OnClick="btnIns_Click" />
            <asp:Label ID="lblNew" Visible="true" runat="server" Text=""></asp:Label>
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server">
                            <asp:ListItem Value="Festivals"></asp:ListItem>
                            <asp:ListItem Value="Plays"></asp:ListItem>
                            <asp:ListItem Value="Exhibition"></asp:ListItem>
                        </asp:DropDownList>


                    </td>
                </tr>
                <tr>
                    <td>Desc</td>
                    <td>
                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Website</td>
                    <td>
                        <asp:TextBox ID="txtWeb" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>
                        <asp:FileUpload ID="flImage" runat="server" /></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                </asp:Panel>
            <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" Font-Size="smaller" BackColor="White" BorderColor="#CCCCCC"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="eventID" OnPageIndexChanging="gvEvents_PageIndexChanging" OnRowCommand="gvEvents_RowCommand">
                <Columns>
                    <asp:BoundField DataField="eventID" HeaderText="eventID" InsertVisible="False" ReadOnly="True" SortExpression="eventID" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="website" HeaderText="website" SortExpression="website" />
                    <asp:ImageField DataImageUrlField="image" HeaderText="image" SortExpression="image">
                    </asp:ImageField>
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                     <asp:ButtonField ButtonType="Button" CommandName="del" HeaderText="del" Text="del" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [eventID], [type], [name], [description], [website], [image], [date] FROM [tbEvents]"></asp:SqlDataSource>

        </asp:Panel>


        <%-- <h2>Universities/Schools</h2>
        <br />
        <br />
        <br />
        <asp:GridView ID="gvUniversity" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="SchoolID" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnPageIndexChanging="gvUniversity_PageIndexChanging">

            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="SchoolID" HeaderText="SchoolID" InsertVisible="False" ReadOnly="True" SortExpression="SchoolID" />
                <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName" />
                <asp:BoundField DataField="SchoolTypeId" HeaderText="SchoolTypeId" SortExpression="SchoolTypeId" />
                <asp:BoundField DataField="SchoolPhoneNumber" HeaderText="SchoolPhoneNumber" SortExpression="SchoolPhoneNumber" />
                <asp:BoundField DataField="SchoolAddress" HeaderText="SchoolAddress" SortExpression="SchoolAddress" />
                <asp:BoundField DataField="SchoolPostalCode" HeaderText="SchoolPostalCode" SortExpression="SchoolPostalCode" />
                <asp:BoundField DataField="SchoolWebsite" HeaderText="SchoolWebsite" SortExpression="SchoolWebsite" />
                <asp:BoundField DataField="SchoolDescription" HeaderText="SchoolDescription" SortExpression="SchoolDescription" />
                <asp:BoundField DataField="School_path" HeaderText="School_path" SortExpression="School_path" />
                <asp:BoundField DataField="SchoolLocationID" HeaderText="SchoolLocationID" SortExpression="SchoolLocationID" />
                <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="Delete" ShowHeader="True" Text="Del" />
                <asp:ButtonField ButtonType="Button" CommandName="update" HeaderText="Update" ShowHeader="True" Text="Upd" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbGroupProjectConnectionString %>" SelectCommand="SELECT [SchoolID], [SchoolName], [SchoolType], [SchoolPhoneNumber], [SchoolAddress], [SchoolPostalCode], [SchoolWebsite], [SchoolDescription], [School_path], [SchoolLocationID] FROM [tbUniversitiesColleges]"></asp:SqlDataSource>--%>
    </asp:Panel>
</asp:Content>
