$( document ).on('turbolinks:load', function() {
  return $('#orders-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#orders-table").data("source"),
    },
    pagingType: 'full_numbers',
  });
});
