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
