function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var profileAddress = document.getElementById('adress');

    if (profileAddress) {
      var autocomplete = new google.maps.places.Autocomplete(profileAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(profileAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
