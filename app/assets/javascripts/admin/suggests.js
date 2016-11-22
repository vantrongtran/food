$( document ).on('turbolinks:load', function() {
  return $('#suggests-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#suggests-table").data("source"),
    },
    pagingType: 'full_numbers',
  });
});
