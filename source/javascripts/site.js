// on page ready
$(document).ready(function () {

  var beenHereBefore = localStorage.getItem("iwashere");
  // REMOVE COMMENT from code BELOW TO TURN ON STOP_REVISIT 
  if(typeof beenHereBefore === 'undefined' || beenHereBefore == null) {

    //Controls how the modal popup is closed with the close button
    function HideDialog()
    {
      $("#bkgOverlay").fadeOut(400);
      $("#delayedPopup").fadeOut(300);
    }

    //Fade in delay for the background overlay (control timing here)
    $("#bkgOverlay").delay(11800).fadeIn(400);

    //Fade in delay for the popup (control timing here)
    $("#delayedPopup").delay(12000).fadeIn(400);

    //Hide dialog and background when the user clicks the close button
    $("#btnClose").click(function (e) {
      HideDialog();
      localStorage.setItem('iwashere',true);
      e.preventDefault();
    });
  // REMOVE COMMENT from code BELOW TO TURN ON STOP_REVISIT 
  }

});

//Get the button:
mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}