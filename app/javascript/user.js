// app/assets/javascripts/users.js
$(document).on('change', '#region-select', function() {
    var region = $(this).val();
    $.ajax({
      url: '/users/fetch_seeded_data',
      method: 'GET',
      data: { region: region },
      success: function(data) {
        // Update table with fetched data
        $('#name-column').text(data.name);
        $('#phone-column').text(data.phone);
        $('#address-column').text(data.address);
      }
    });
  });
  