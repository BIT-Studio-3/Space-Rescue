var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}


<h1>%Insert Beach Name%</h1>
<h3>**Insert some basic beach information**</h3>
<hr>

<button class="accordion">5 Day Forecast</button>
<div class="panel">
  <p>**Insert 5 day forecast with data pulled from the Weather API**</p>
</div>

<button class="accordion">Water Status</button>
<div class="panel">
  <p>**Insert water information with data pulled from the API**</p>
</div> 

<button class="accordion">Beach Information and Safety</button>
<div class="panel">
  <p>**Insert any safety notes about the beach, I found the information at https://www.findabeach.co.nz/beaches/**</p>
</div> 

<button class="accordion">Additional Notes</button>
<div class="panel">
  <p>**Insert manually any additional information in regards to the beach including access and facilities nearby**</p>
</div> 

body {
    font-family: 'rubik', sans-serif;
  }
  
  .accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: center;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
  }
  
  .active, .accordion:hover {
    background-color: #ccc;
  }
  
  .panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
  }
  
  .panel2 {
    padding:  px;
    background-color: white;
    max-height: 0;
    overflow: shown;
  }
  
  h1, h3 {
    text-align: center;
  }

