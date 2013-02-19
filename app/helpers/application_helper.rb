module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  def map_loader(latitudes, longitudes)
    javascript = <<-JAVASCRIPT
    function initialize() {
      var mapOptions = {
        zoom: 4,
        center: new google.maps.LatLng(0, 120.644),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
      
      #{
        varLat = "var varLat = [#{latitudes.join(',')}];"
        varLng = "var varLng = [#{longitudes.join(',')}];"
        varLat + varLng
      }
      
      var markers = [];
      for (var i = 0; i < varLat.length; i++) {
        var newLatLng = new google.maps.LatLng(varLat[i], varLng[i]);
        var marker = new google.maps.Marker({position: newLatLng,map: map});
        markers.push(marker);
      }
      var markerCluster = new MarkerClusterer(map, markers);
    }
    
    function loadScript() {
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyCEY0Wtv2sMZZRW0Fb3hmutA-7ET0O-58o&sensor=true&callback=initialize";
      document.body.appendChild(script);
    }
    
    window.onload = loadScript;
    JAVASCRIPT
  end
end
