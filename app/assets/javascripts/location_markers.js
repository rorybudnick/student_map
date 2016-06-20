function initMap(){
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(34.052, -118.244),
  });
  var locations = $('.locations_information').data('locations')
  var studentCounts = $('.locations_information').data('students')
  var marker, i;
  for (i = 0; i < locations.length; i++) {
    var currentLocation = locations[i]
    if (currentLocation.street_2){
      var formattedStreet = currentLocation.street + "\n" + currentLocation.street_2
    } else {
      var formattedStreet = currentLocation.street + "\n"
    }
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i].latitude, locations[i].longitude),
      title: currentLocation.name,
      studentCount: studentCounts[i],
      street: formattedStreet
    });
    marker.setMap(map);



    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        var infoWindow = new google.maps.InfoWindow();
        var infoText = '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h3 id="firstHeading" class="firstHeading">' +
          marker.title +
          '</h3>'+
          '<div id="bodyContent">'+
          '<p><i>'+
          marker.street +
          '</i></p>' +
          '<p>' +
          marker.studentCount +
          '</p>'+
          '</div>';
        infoWindow.setContent(infoText);
        infoWindow.open(map, marker);
      }
    })(marker, i));
  }
}
