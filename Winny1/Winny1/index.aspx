<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Winny1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
			  
              <div class="panel" id="gallery">
                <h1>Our Gallery</h1>
                <div id="gallery_container">
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/WinnipegSign.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/ForksHarbour.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/GoldenBoy.png" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="WpgImages/InsideLegislature.png" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/PortageMain.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/WinnieBear.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/BoyAndBoot.jpg" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="WpgImages/AcrossRiver.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/Pool.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/PortageAve.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/TheForks.jpg" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="WpgImages/Winter.jpg" /></a> </div>
                  <div class="cleaner"></div>
                </div>
              </div>
        
  		<div id="footer">

            <div id="footer_left">
				
            	Copyright © 2018 <a href="#">The Omega Group (SD28)</a><br />
            	 <%--Winnipeg by <a rel="nofollow" href="htp://www.tooplate.com">Templates</a><br /> --%>
                
            </div>
			
            <div class="cleaner">
            </div>

 	    </div>
    </div>

</asp:Content>
