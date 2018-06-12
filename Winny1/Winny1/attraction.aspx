<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attraction.aspx.cs" Inherits="Winny1.attraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body {
    height: 100%;
    margin: 0;
    font-family: Arial;
}

/* Style tab links */
.tablink {
    background-color:cornflowerblue;
    color: yellow;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 25%;
}

.tablink:hover {
    background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
    color: white;
    display: none;
    padding: 100px 20px;
    height: 100%;
}

#Galleries {background-color: red;}
#Museums {background-color: green;}
#Parks {background-color: blue;}

</style>

<body>

<button class="tablink" onclick="openPage('Home', this, 'red')">Galleries</button>
<button class="tablink" onclick="openPage('News', this, 'green')" id="defaultOpen">Museums</button>
<button class="tablink" onclick="openPage('Contact', this, 'blue')">Parks</button>


<div id="Home" class="tabcontent">
  <h3>Galleries</h3>
  <p>Home is where the heart is..</p>
</div>

<div id="News" class="tabcontent">
  <h3>Museums</h3>
  <p>Some news this fine day!</p> 
</div>

<div id="Contact" class="tabcontent">
  <h3>Parks/Zoo</h3>
  <p>Get in touch, or swing by for a cup of coffee.</p>
</div>



<script>
function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
  </body>   
    


</asp:Content>
