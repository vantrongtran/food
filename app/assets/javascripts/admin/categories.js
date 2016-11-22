$( document ).on('turbolinks:load', function() {
  return $('#categories-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#categories-table").data("source"),
    },
    pagingType: 'full_numbers',
  });
});
