class Coordinate {
  double latitude;
  double longitude;

  Coordinate({this.latitude, this.longitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(latitude: json['latitude'], longitude: json['longitude']);
  }
}