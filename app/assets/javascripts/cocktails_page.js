$(document).ready(function() {

  var $grid = $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
    columnWidth: '.grid-sizer'
  });
  // layout Masonry after each image loads

    $grid.masonry();

  $("#surprise").on("click", function(event){

    $.ajax({
      type: "GET",
      url: "cocktails/random",
      success: function(data) {
        console.log(data)
      },
      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });
});
