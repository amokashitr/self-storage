function loadCitiesZip() {
  var list;
  $.ajax({
    url: `/search/retrieve_cities_zip`,
    type: "GET",
    dataType: 'json',
    success: function(data) {
      populateSearch(data)
    }
  });
}

function populateSearch(data) {
  return $('#city_zip').autocomplete({
    source: data['values']
  });
}

$(document).on('click', '.storage_unit_filters', function() {
  $('#filter-btn').trigger('click');
});

$(document).on('change', '#filter_units_by_size, #filter_units_by_amenity', function() {
  var id = $(this).attr("storage_unit_id");
  var size = $('#filter_units_by_size').val();
  var amenity = $('#filter_units_by_amenity').val();
  $.ajax({
    url: `/storage_units/` + id + `/units/filter`,
    type: "GET",
    dataType: 'script',
    data: {size: size, amenity: amenity}
  });
});

$(document).ready(function () {
  $('.digg_pagination a').each(function () {
    $(this).attr("data-turbolinks", false);
  })
});

function intializeDataTableSort() {
  $('.datatable').DataTable({
    dom: "<'form-row'<'col'f><'col-auto'l>><'row'<'col-md-12't>><'form-row'<'col-auto'p>>",
    iDisplayLength: 10,
    pagingType: 'simple_numbers',
    language: {
                lengthMenu: "Per Page: _MENU_ ",
                paginate: {
                  next: '<i class="fa fa-arrow-right grey">',
                  previous: '<i class="fa fa-arrow-left grey">'  
                }
    },
    info:     false,
    aoColumnDefs: [{
                      bSortable: false,
                      aTargets: [-1]
    }],
    drawCallback: function(settings) {
      var pagination = $(this).closest('.dataTables_wrapper').find('.dataTables_paginate');
      pagination.toggle(this.api().page.info().pages > 1);
    }
  });
}