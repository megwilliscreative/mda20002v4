// on page ready
$(document).ready(function () {

  var beenHereBefore = localStorage.getItem("iwashere");

  if(typeof beenHereBefore === 'undefined' || beenHereBefore == null) {

    //Controls how the modal popup is closed with the close button
    function HideDialog()
    {
      $("#bkgOverlay").fadeOut(400);
      $("#delayedPopup").fadeOut(300);
    }

    //Fade in delay for the background overlay (control timing here)
    $("#bkgOverlay").delay(4800).fadeIn(400);

    //Fade in delay for the popup (control timing here)
    $("#delayedPopup").delay(5000).fadeIn(400);

    //Hide dialog and background when the user clicks the close button
    $("#btnClose").click(function (e) {
      HideDialog();
      localStorage.setItem('iwashere',true);
      e.preventDefault();
    });

  }

});
