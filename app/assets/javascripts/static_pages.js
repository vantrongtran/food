function loadProduct(id){
  $.ajax({
    type: 'GET',
    url: '/products?categoryId='+id,
    dataType: 'script',
    success: function(data){
    },
    error: function(error_message) {
        alert('Failed!');
      },
  });
}

function search(){
  $("#search").keyup(function () {
    key = $(this).val();
    console.log(key);
    $.ajax({
    type: 'GET',
    url: '/products?name='+key,
    dataType: 'script',
    error: function(error_message) {
        alert('Failed!');
      },
    });
  });
}

$(document).ready(function() {
  search();
});

$( document ).on('turbolinks:load', function() {
  search();
})
