﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Winny1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #footer {
            /*background-color: #12152e;*/
            padding: 10px;
            text-align: center;
            /*color: steelblue;*/
            /*border: double;
            border-color: gold;*/
            width:100%;
            height:15px;
        }
    </style>
    <div class="cleaner">
 </div>
     
     <div id="content">
        <div class="scroll">
           <div class="scrollContainer">
			
              <div class="panel" id="home">
                <div class="col_380 float_l">
                  <h2>Welcome to Winnipeg</h2>
                  <img src="images/tooplate_image_01.jpg" alt="Image 01" class="image_wrapper" />
                  <p><em>Winnipeg is located at the confluence of the Red and Assiniboine Rivers.  Known as the "Gateway to the West", Winnipeg is a railway and transportation hub with a diversified economy.</em></p>
                  <p><em>The city was founded in 1873 and the word 'Winnipeg' comes from the Western Cree words that mean 'muddy water'.</em></p>
                </div>
                <div class="col_270 float_r">
                  <h2>Our Services</h2>
                  <ul class="service_list">
                    <li><a href="http://www.winnipegpass.com/city/" ><strong>Winnipeg City Pass</strong></a></li>

                        <li><a href="https://www.theweathernetwork.com/ca/weather/manitoba/winnipeg" ><strong>Winnipeg Weather</strong></a></li>
                        <li><a href="http://winnipegtransit.com/en" ><strong>Winnipeg Transit</strong></a></li>
                        <li><a href="https://goo.gl/maps/Bg8GWt8qps52"><strong>Map</strong></a></li>
                  
                  </ul>
                </div>
              </div>
            </div>
        </div>
			  
             <%-- <div class="panel" id="gallery">
                <h1>Our Gallery</h1>
                <div id="gallery_container" >
                  <div class="gallery_box" > <a href="WpgImages/WinnipegSign.jpg" ><img src="WpgImages/WinnipegSign.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/ForksHarbour.jpg"><img src="WpgImages/ForksHarbour.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/GoldenBoy.png"><img src="WpgImages/GoldenBoy.png" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="WpgImages/InsideLegislature.png"><img src="WpgImages/InsideLegislature.png" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/PortageMain.jpg"><img src="WpgImages/PortageMain.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/WinnieBear.jpg"><img src="WpgImages/WinnieBear.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/BoyAndBoot.jpg"><img src="WpgImages/BoyAndBoot.jpg" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="WpgImages/AcrossRiver.jpg"><img src="WpgImages/AcrossRiver.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/Pool.jpg"><img src="WpgImages/Pool.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/PortageAve.jpg"><img src="WpgImages/PortageAve.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="WpgImages/TheForks.jpg"><img src="WpgImages/TheForks.jpg" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="WpgImages/Winter.jpg"><img src="WpgImages/Winter.jpg" /></a> </div>
                  <div class="cleaner"></div>
                </div>
              </div>--%>
        <br />
           <br />
  		<div id="footer">

           <%-- <div id="footer_left">
                <%--Copyright © 2018--%> 
               <%-- <a href="#">The Omega Group (SD28)</a>--%>
                 <p style="color:white;  text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;"><strong>ROBERTSON COLLEGE / THE OMEGA GROUP(SD28) / SUMMER 2018</strong></p>
                <br />
            </div>
			
            <%--<div class="cleaner">
            </div>--%>

 	   
    </div>

</asp:Content>
