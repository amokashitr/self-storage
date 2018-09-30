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