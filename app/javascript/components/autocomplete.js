

function autocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
    var place = this.getPlace();

    for (var i in place.address_components) {
      var component = place.address_components[i];
      for (var j in component.types) {
        var type_element = document.getElementById(`profile_${component.types[j]}`);
        if (type_element) {
          type_element.value = component.long_name;
        }
      }
    }

    var longitude = document.getElementById("profile_longitude");
    var latitude = document.getElementById("profile_latitude");
    longitude.value = place.geometry.location.lng();
    latitude.value = place.geometry.location.lat();
  }

google.maps.event.addDomListener(window, 'load', function() {
  autocomplete('profile_adress');
});


export { autocomplete };
