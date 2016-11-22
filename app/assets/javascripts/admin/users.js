$( document ).on('turbolinks:load', function() {
  return $('#users-table').dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#users-table").data("source"),
    },
    pagingType: 'full_numbers',
  });
});
