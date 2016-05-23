// var locations = $('.locations_information').data('locations')
function initMap(){
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(34.052, -118.244),
  });

  var locations = [["Los Angeles Center", 34.052, -118.244]]
  // var infowindow = new google.maps.InfoWindow();
  var marker, i;
  for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      title: locations[i][0]
    });
    marker.setMap(map);

    // google.maps.event.addListener(marker, 'click', (function(marker, i) {
    //   return function() {
    //     infowindow.setContent(locations[i][0]);
    //     infowindow.open(map, marker);
    //   }
    // })(marker, i));
  }
}
