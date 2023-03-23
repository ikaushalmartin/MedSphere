import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _mapController;
  late LatLng _initialLocation;
  late LatLng _destinationLocation;
  late String _distance;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialLocation = LatLng(position.latitude, position.longitude);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMapTap(LatLng location) {
    setState(() {
      _destinationLocation = location;
    });
  }

  Future<void> _calculateDistance() async {
    double distanceInMeters = await Geolocator.distanceBetween(
      _initialLocation.latitude,
      _initialLocation.longitude,
      _destinationLocation.latitude,
      _destinationLocation.longitude,
    );
    setState(() {
      _distance = '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            onTap: _onMapTap,
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 15,
            ),
            markers: _destinationLocation == null
                ? {}
                : {
                    Marker(
                      markerId: MarkerId('Destination'),
                      position: _destinationLocation,
                    ),
                  },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed:
                  _destinationLocation == null ? null : _calculateDistance,
              child: Text('Calculate Distance'),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Text(
              _destinationLocation == null
                  ? 'Tap on the map to select a destination location.'
                  : 'Destination: ${_destinationLocation.latitude}, ${_destinationLocation.longitude}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Text(
              _distance == null ? '' : 'Distance: $_distance',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
