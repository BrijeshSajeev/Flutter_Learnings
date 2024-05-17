import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocatonInputState();
  }
}

class _LocatonInputState extends State<LocationInput> {
  // Location? _loadedLoaction;
  var _isLoadingLoaction = false;
  var _isLoadedLoaction = false;
  double _lat = 51.509364;
  double _lng = -0.128928;

  void _getLoaction() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isLoadingLoaction = true;
    });

    locationData = await location.getLocation();

    setState(() {
      _isLoadingLoaction = false;
      _isLoadedLoaction = true;
      _lng = locationData.longitude!;
      _lat = locationData.latitude!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      "No location selected",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
    if (_isLoadingLoaction) {
      content = const CircularProgressIndicator();
    }

    if (_isLoadedLoaction) {
      content = FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(_lat, _lng),
          initialZoom: 9.8,
        ),
        children: [
          TileLayer(
            // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: content,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on_outlined),
              onPressed: _getLoaction,
              label: const Text("Get current loaction"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              onPressed: () {},
              label: const Text("Select on Map"),
            ),
          ],
        ),
      ],
    );
  }
}
