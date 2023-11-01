import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';

class MapScreen2 extends StatefulWidget {
  const MapScreen2({super.key});

  @override
  State<MapScreen2> createState() => MapScreen2State();
}

class MapScreen2State extends State<MapScreen2> {
  //FAB navigate back to user location
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  @override
  void initState() {
    //FAB navigate back to user location
    super.initState();
    _followOnLocationUpdate = FollowOnLocationUpdate.always;
    _followCurrentLocationStreamController = StreamController<double?>();
  }

  @override //FAB navigate back to user locatione
  void dispose() {
    _followCurrentLocationStreamController.close();
    super.dispose();
  }

  var marker = <Marker>[
    Marker(
      point: const LatLng(27.6710, 85.4298),
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          print('BHAKTAPUR');
        },
        child: const Icon(
          Icons.location_pin,
          color: Colors.green,
          size: 50,
        ),
      ),
    ),
    Marker(
      point: const LatLng(27.700769, 85.300140),
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          print('KATHMANDU');
        },
        child: const Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 50,
        ),
      ),
    ),
    Marker(
      point: const LatLng(28.2096, 83.9856),
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          print('POKHARA');
        },
        child: const Icon(
          Icons.location_pin,
          color: Colors.blue,
          size: 50,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map2'),
      ),
      body: Stack(
        children: [
          Flexible(
            child: FlutterMap(
              mapController: MapController(),
              options: MapOptions(
                initialZoom: 17,
                // Stop following the location marker on the map if user interacted with the map.
                onPositionChanged: (MapPosition position, bool hasGesture) {
                  if (hasGesture &&
                      _followOnLocationUpdate != FollowOnLocationUpdate.never) {
                    setState(
                      () => _followOnLocationUpdate =
                          FollowOnLocationUpdate.never,
                    );
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                CurrentLocationLayer(
                  followCurrentLocationStream:
                      _followCurrentLocationStreamController.stream,
                  followOnLocationUpdate: _followOnLocationUpdate,
                  turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
                  style: const LocationMarkerStyle(
                    marker: DefaultLocationMarker(),
                    markerDirection: MarkerDirection.heading,
                    markerSize: Size.square(35),
                    headingSectorRadius: 90,
                  ),
                ),
                Align(
                  //FAB navigate back to user location
                  alignment: const Alignment(0, 0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.black54,
                      onPressed: () {
                        // Follow the location marker on the map when location updated until user interact with the map.
                        setState(
                          () => _followOnLocationUpdate =
                              FollowOnLocationUpdate.always,
                        );
                        // Follow the location marker on the map and zoom the map to level 18.
                        _followCurrentLocationStreamController.add(17);
                      },
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                MarkerLayer(
                  markers: marker,
                  rotate: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
