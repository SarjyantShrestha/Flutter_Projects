import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:parkwise/screens/floating_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: true,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: mapController,
            osmOption: OSMOption(
              zoomOption: const ZoomOption(
                initZoom: 20,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.navigation,
                    color: Colors.blue,
                    size: 100,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.navigation_rounded,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),
              ),
              // roadConfiguration: const RoadOption(
              //   roadColor: Colors.yellowAccent,
              // ),
              // markerOption: MarkerOption(
              //   defaultMarker: const MarkerIcon(
              //     icon: Icon(
              //       Icons.person_pin_circle,
              //       color: Colors.blue,
              //       size: 56,
              //     ),
              //   ),
              // ),
            ),
          ),
          // buildFloatingSearchBar(context), //FEATURE DISABLED FOR NOW
          // Custom marker at Kathmandu location
        ],
      ),
    );
  }
}
