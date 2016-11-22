$( document ).on('turbolinks:load', function() {
  return $('#products-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#products-table").data("source"),
    },
    pagingType: 'full_numbers',
  });
});
