<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Winny1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cleaner"></div>
     
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
                   
                    <li><a href="#" class="service_five">Maecenas ut pretium</a></li>
                  </ul>
                </div>
              </div>
                </div>
              </div>

              <!-- end of home -->
			  
              <%--<div class="panel" id="about">
                <div class="col_320 float_l">
                  <h1>About Us</h1>
                  <img src="images/aboutUs.jpg"  alt="Image 02" class="image_wrapper" />
                  <p><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in lectus turpis. Vivamus cursus tortor quis leo ullamcorper auctor quis tincidunt metus. In non ipsum leo.</em></p>
                  <p>Vestibulum vitae lectus a leo commodo egestas. Sed et ligula mauris. Donec interdum iaculis eros, sed porttitor justo ornare ac. Suspendisse ultrices arcu auctor sapien <a href="#">malesuada dictum</a>. Maecenas varius blandit risus in varius. Donec eget arcu nisi.</p>
                </div>
                <div class="col_320 float_r">
                  <h2>Testimonials</h2>
                  <blockquote>
                    <p>Fusce nec felis id lacus sollicitudin vulputate. Proin tincidunt, arcu id pellentesque accumsan, neque dolor imperdiet ligula, quis viverra tellus nulla a odio. Curabitur vitae enim risus, at placerat turpis. Fusce adipiscing aliquam faucibus.</p>
                    <cite>William - <span>Senior Webmaster</span></cite> </blockquote>
                  <div class="cleaner_h40"></div>
                  <blockquote>
                    <p>Integer et interdum risus. Vestibulum et tellus nec risus varius convallis. Suspendisse turpis massa, vestibulum quis lacinia porta, mattis non mi. Fusce consectetur eros in metus iaculis molestie. Cras malesuada egestas gravida.</p>
                    <cite>Paul - <span>Web Designer</span></cite> </blockquote>
                </div>
              </div>
			  <!-- end of aboutus -->
			  
              <div class="panel" id="services">
                <div class="col_380 float_l">
                  <h1>Service Overview</h1>
                  <p><em>Nam at arcu libero, ut venenatis elit. Nulla eget risus turpis, non aliquet dui ornare vitae urna ut venenatis ipsum. </em></p>
                  <img src="images/tooplate_image_03.jpg" alt="Image 03" class="image_wrapper" />
                  <p>Sed eu libero quis neque laoreet cursus. Fusce elit metus, elementum nec consequat a, interdum vitae est. Aliquam sit amet odio vitae dui blandit elementum. Ut eu dolor nunc. Nam in nunc sed mi adipiscing lacinia suscipit eget tortor. Vivamus lacinia lectus in <a href="#">velit aliquet</a> ac placerat magna euismod. In hac habitasse platea dictumst. Integer eget nibh eu libero cursus ultricies neque dolor imperdiet nulla a odio.</p>
                </div>
          <%--      <div class="col_270 float_r">
                  <h1>Our Services</h1>
                  <ul class="service_list">
                    <li><a href="#" class="service_one">Morbi luctus vitae cursus</a></li>
                    <li><a href="#" class="service_two">Pellentesq tris senectus</a></li>
                    <li><a href="#" class="service_three">Duis at commodo molestie</a></li>
                    <li><a href="#" class="service_four">In aliquet in libero</a></li>
                    <li><a href="#" class="service_five">Maecenas ut pretium</a></li>
                  </ul>
                </div>--%>
              </div>
			  <!-- end of service -->
			  
              <div class="panel" id="gallery">
                <h1>Our Gallery</h1>
                <div id="gallery_container">
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/BoyAndBoot.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/ForksHarbour.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/GoldenBoy.png" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="WpgImages/InsideLegislature.png" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/PortageMain.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="WpgImages/WinnieBear.jpg" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="images/gallery/image_07.jpg" alt="Image 07" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="images/gallery/image_08.jpg" alt="Image 08" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="images/gallery/image_09.jpg" alt="Image 09" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="images/gallery/image_10.jpg" alt="Image 10" /></a> </div>
                  <div class="gallery_box"> <a href="#"><img src="images/gallery/image_11.jpg" alt="Image 11" /></a> </div>
                  <div class="gallery_box gb_rm"> <a href="#"><img src="images/gallery/image_12.jpg" alt="Image 12" /></a> </div>
                  <div class="cleaner"></div>
                </div>
              </div>
			  <!-- end of gallery -->
			  
                <div class="panel" id="attraction">
                <h1>Attractions</h1>
              
              </div>
                      <!-- end of attraction -->
              <div class="panel" id="contact">
                <h1>Contact Us</h1>
                
                <div class="cleaner_h10"></div>
                <div class="col_380 float_l">
                  <div id="contact_form">
             
					
                      <label for="author">Name:</label><input type="text" id="author" name="author" class="required input_field" />
					  <div class="cleaner_h10"></div>
					  
                      <label for="email">Email:</label><input type="text" id="email" name="email" class="validate-email required input_field" />
                      <div class="cleaner_h10"></div>
					  
                      <label for="text">Message:</label><textarea id="text" name="text" rows="0" cols="0" class="required"></textarea>
                      <div class="cleaner_h10"></div>
					  
                      <input type="submit" class="submit_btn float_l" name="submit" id="submit" value=" Send " />
                      <input type="reset" class="submit_btn float_r" name="reset" id="reset" value="Reset" />
					  
                   
                  </div>
                </div>--%>
				
                <div class="col_270 float_r">
                	<p>Pellentesque a ligula nunc. Morbi est risus, dapibus ut fringilla quis, imperdiet sed erat. Donec tempor venenatis pulvinar. Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</p>
                    
					<h3>Mailing Address</h3>
					<strong>Company Name</strong><br />
					161-242 Etiam quis tortor ante,<br />
					Cras sit amet sagittis, 16100 <br />
					Integer lacinia <br /><br />
					
					Tel: 020-030-0020<br />
					Fax: 040-010-0040<br />
				</div>
              </div>
			  <!-- end of contact -->
			  
            </div>
          
          <!-- end of scroll -->
		
        
  		<div id="footer">
    
        	<div id="social_box">
            	<a href="#"><img src="images/facebook.png" alt="facebook" /></a>
            	<a href="#"><img src="images/flickr.png" alt="flickr" /></a>
            	<a href="#"><img src="images/myspace.png" alt="myspace" /></a>
            	<a href="#"><img src="images/twitter.png" alt="twitter" /></a>
            	<a href="#"><img src="images/youtube.png" alt="youtube" /></a>
            </div>
            
            <div id="footer_left">
				
            	Copyright © 2018 <a href="#">The Omega Group (SD28)</a><br />
            	<!-- Winnipeg by <a rel="nofollow" href="http://www.tooplate.com">Templates</a><br /> -->
                
            </div>
			
            <div class="cleaner"></div>
 		</div>


</asp:Content>
