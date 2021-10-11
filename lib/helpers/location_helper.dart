import 'dart:math';

class LocationLatLng {

  double latitude;
  double longitude;

  LocationLatLng({
    required this.latitude,
    required this.longitude
  });

}

class LocationHelper {

  static double distance(LocationLatLng point1, LocationLatLng point2){

    double lat1 = point1.latitude;
    double lat2 = point2.latitude;

    double lon1 = point1.longitude;
    double lon2 = point2.longitude;

    var p = 0.017453292519943295;
    
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((lon2 - lon1) * p))/2;

    return 12742 * asin(sqrt(a));
    

  }

}