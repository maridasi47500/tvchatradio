
if (window.location.pathname === "/localize/index" && latuser.innerHTML === "" && lonuser.innerHTML === "" && myuserid.innerHTML !== "") {
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
var map = L.map('map').setView([latitude, longitude], 13);
L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);
setTimeout(function () {
    map.invalidateSize();
}, 0);
	  map.on('mouseup', function(e) {
    const latitude = e.latlng.lat;
    const longitude = e.latlng.lng;
		  if ($(".button_to").length > 0){
		  $(".button_to").attr("action","/localize/localization?lat="+latitude+"&lon="+longitude);
		  }
var popup = L.popup()
    .setLatLng([parseFloat(latitude), parseFloat(longitude)])
    .setContent("vous êtes ici")
    .openOn(map);
	  });

  });
} else {
  console.log("Geolocation is not supported by this browser.");
}
}else if (window.location.pathname === "/localize/index" && myuserid.innerHTML !== "") {
    const latitude = parseFloat(latuser.innerHTML);
    const longitude = parseFloat(lonuser.innerHTML);
    console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
var map = L.map('map').setView([latitude, longitude], 13);
L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);
setTimeout(function () {
    map.invalidateSize();
}, 0);
	  map.on('mouseup', function(e) {
    const latitude = e.latlng.lat;
    const longitude = e.latlng.lng;
		  if ($(".button_to").length > 0){
		  $(".button_to").attr("action","/localize/localization?lat="+latitude+"&lon="+longitude);
		  }
var popup = L.popup()
    .setLatLng([parseFloat(latitude), parseFloat(longitude)])
    .setContent("vous êtes ici")
    .openOn(map);
	  });

}
if (document.getElementById("btnlocation")){
btnlocation.onclick=function(){
var fd=new FormData();
fd.set("latitude",btnlocation.dataset.latitude);
fd.set("longitude",btnlocation.dataset.longitude);
fd.set("userid",btnlocation.dataset.userid);
  $.ajax({
    // Your server script to process the upload
    url: "/updatelocation",
    type: "post",

    // Form data
    data: fd,

    // Tell jQuery not to process data or worry about content-type
    // You *must* include these options!
    cache: false,
    contentType: false,
    processData: false,

    // Custom XMLHttpRequest
    success: function (data) {
	    console.log("HEY")
	    console.log(JSON.stringify(data))
	    console.log(JSON.stringify(data.redirect))
	    if (data.redirect){
	    window.location=data.redirect;
	    }else{
	    window.location="/";
	    }
},
    xhr: function () {
      var myXhr = $.ajaxSettings.xhr();
      if (myXhr.upload) {
        // For handling the progress of the upload
        myXhr.upload.addEventListener('progress', function (e) {
          if (e.lengthComputable) {
            $('progress').attr({
              value: e.loaded,
              max: e.total,
            });
          }
        }, false);
      }
      return myXhr;
    }
  });
	return false;
}

}

