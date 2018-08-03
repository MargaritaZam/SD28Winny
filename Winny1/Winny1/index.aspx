<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Winny1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
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
        .ml14 {
  font-weight: 600;
  font-size: 2.2em;
  color:white;
  text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
}
.ml14 .text-wrapper {
  position: relative;
  display: inline-block;
  padding-top: 0.1em;
  padding-right: 0.05em;
  padding-bottom: 0.15em;
}

.ml14 .line {
  opacity: 0;
  position: absolute;
  left: 0;
  height: 2px;
  width: 100%;
  background-color: #fff;
  transform-origin: 100% 100%;
  bottom: 0;
}

.ml14 .letter {
  display: inline-block;
  line-height: 1em;
}
       
    </style>
    <div class="cleaner">
 </div>
    
     <div id="content" >
        <div class="scroll">
           <div class="scrollContainer">
			
              <div class="panel" id="home" >
                <div class="col_380 float_l">
                  <h2  class="ml14" >
                      <span class="text-wrapper">
                          <span class="letters">Welcome to Winnipeg</span>
                          <span class="line"></span>
                      </span>
                      </h2>
                  <img src="images/tooplate_image_01.jpg" alt="Image 01" class="image_wrapper" />
                    
                  <p style="text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue; font-size:15px"><em>Winnipeg is located at the confluence of the Red and Assiniboine Rivers.  Known as the "Gateway to the West", Winnipeg is a railway and transportation hub with a diversified economy.</em></p>
                  <p style="text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;font-size:15px"><em>The city was founded in 1873 and the word 'Winnipeg' comes from the Western Cree words that mean 'muddy water'.</em></p>
                </div>
                <div class="col_270 float_r">
                  <h2 style="margin-left: 60px">Our Services</h2>
                  <ul class="service_list">
                    <li><a href="http://www.winnipegpass.com/city/" ><img id="img" src="Events/City.png" style="width:30px; height:30px; border:double; border-color:white; border-radius:50%" /><strong> Winnipeg City Pass</strong></a></li>
                    <li><a href="https://www.theweathernetwork.com/ca/weather/manitoba/winnipeg" ><img id="img1" src="Events/the-weather-network-logo.png" style="width:30px; height:30px; border:double; border-color:white;border-radius:50%"" /><strong> Winnipeg Weather</strong></a></li>
                    <li><a href="http://winnipegtransit.com/en" ><img id="img2" src="Events/transit.jpg" style="width:30px; height:30px; border:double; border-color:white;border-radius:50%"" /><strong> Winnipeg Transit</strong></a></li>
                    <li style="margin-right:95px"><a  href="https://goo.gl/maps/Bg8GWt8qps52"><img id="img3" src="Events/maps.jpg" style="width:30px; height:30px; border:double; border-color:white;border-radius:50%"" /><strong>Map</strong></a></li>
                  
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
    <script>
$('.ml14 .letters').each(function(){
  $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
});

anime.timeline({loop: true})
  .add({
    targets: '.ml14 .line',
    scaleX: [0,1],
    opacity: [0.5,1],
    easing: "easeInOutExpo",
    duration: 900
  }).add({
    targets: '.ml14 .letter',
    opacity: [0,1],
    translateX: [40,0],
    translateZ: 0,
    scaleX: [0.3, 1],
    easing: "easeOutExpo",
    duration: 800,
    offset: '-=600',
    delay: function(el, i) {
      return 150 + 25 * i;
    }
  }).add({
    targets: '.ml14',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });
    </script>
</asp:Content>
