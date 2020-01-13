import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';

class ForecastsMap extends StatefulWidget {
  @override
  State<ForecastsMap> createState() => ForecastsMapState();
}

class ForecastsMapState extends State<ForecastsMap> {
  final ForecastsService _service = ForecastsService();
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          markers: Set<Marker>.of(_markers),
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (latLong) async {
            setState(() {
              _markers = [
                Marker(
                    markerId: MarkerId("id"),
                    position: latLong,
                    infoWindow: InfoWindow(title: "Loading"))
              ];
            });

            // var data = await _service.currentWeatherOf(
            //     latLong.latitude.toString(), latLong.longitude.toString());
            // print(data['main']);
            
            // setState(() {
            //   _markers = [
            //     Marker(
            //         markerId: MarkerId("id"),
            //         position: latLong,
            //         infoWindow: InfoWindow(
            //             title: Temperature(data['main']['temp'])
            //                 .celsius
            //                 .toInt()
            //                 .toString()))
            //   ];
            // });
          },
        ));
  }
}
