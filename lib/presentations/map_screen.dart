import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:maps_launcher/maps_launcher.dart';

class PasayCityMap extends StatefulWidget {
  const PasayCityMap({Key? key}) : super(key: key);

  @override
  _PasayCityMapState createState() => _PasayCityMapState();
}

class _PasayCityMapState extends State<PasayCityMap> {
  late GoogleMapController mapController;
  MapType _currentMapType = MapType.hybrid;
  Set<Polyline> _polylines = {};
  LatLng? _userLocation;
  Place? _selectedPlace;
  PlaceType? _selectedPlaceType;

  final LatLng _center = const LatLng(14.5372, 121.0011);
  final LatLngBounds _philippinesBounds = LatLngBounds(
    southwest: LatLng(4.0, 116.0), // Approximate southwest corner of the Philippines
    northeast: LatLng(21.0, 126.0), // Approximate northeast corner of the Philippines
  );
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers();
    _setMapStyle(controller);
  }

  // Lock the map within these bounds
  void _onCameraMove(CameraPosition position) {
    if (!_philippinesBounds.contains(position.target)) {
      // If the user tries to move outside the bounds, animate back to the nearest point within bounds
      mapController.moveCamera(CameraUpdate.newLatLngBounds(_philippinesBounds, 0));
    }
  }

  void _addMarkers() {
    setState(() {
      _markers.clear();
      for (final place in places) {
        if (_selectedPlaceType == null || place.type == _selectedPlaceType) {
          final marker = Marker(
            markerId: MarkerId(place.name),
            position: place.latLng,
            infoWindow: InfoWindow(
              title: place.name,
              snippet: place.address,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                place.type == PlaceType.touristSpot ? BitmapDescriptor.hueRed :
                place.type == PlaceType.accommodation ? BitmapDescriptor.hueViolet :
                BitmapDescriptor.hueOrange
            ),
            onTap: () {
              setState(() {
                _selectedPlace = place;
              });
              _showPlaceInfo(place);
            },
          );
          _markers[place.name] = marker;
        }
      }
    });
  }

  void _setMapStyle(GoogleMapController controller) async {
    String style = '''
    [
      {
        "featureType": "administrative",
        "elementType": "geometry",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "transit",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ]
  ''';
    await controller.setMapStyle(style);
  }

  void _onMapTypeChanged(MapType? value) {
    if (value != null) {
      setState(() {
        _currentMapType = value;
      });
    }
  }

  void _onPlaceTypeChanged(PlaceType? value) {
    setState(() {
      _selectedPlaceType = value;
      _addMarkers();
    });
  }

  Future<void> _goToCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location permissions are denied'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permissions are permanently denied'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng latLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _userLocation = latLng;
      });

      mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Current location found'),
          backgroundColor: Colors.blue,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to get current location'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showPlaceInfo(Place place) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: EdgeInsets.all(24),
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red, size: 20),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                place.address,
                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        _buildInfoRow(Icons.category, 'Type', place.type.toString().split('.').last),
                        SizedBox(height: 16),
                        _buildInfoRow(Icons.info_outline, 'Description', place.description),
                        SizedBox(height: 16),
                        _buildInfoRow(Icons.star, 'Specialty', place.specialty),
                        SizedBox(height: 32),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _getDirectionsToPlace(place);
                          },
                          icon: Icon(Icons.directions),
                          label: Text('Get Directions'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _getDirectionsToPlace(Place place) async {
    if (_userLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please get your current location first'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineRequest request = PolylineRequest(
      origin: PointLatLng(_userLocation!.latitude, _userLocation!.longitude),
      destination: PointLatLng(place.latLng.latitude, place.latLng.longitude),
      mode: TravelMode.driving,
    );

// Request directions with your API key
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyD4UAtE_r8JjBbd0o5qfv3ZSPX_8xkNJ7c', // Provide your Google API key here
      request: request,
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      setState(() {
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: PolylineId('route'),
          color: Colors.blue,
          points: polylineCoordinates,
          width: 5,
        ));
      });

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          polylineCoordinates.map((e) => e.latitude).reduce(min),
          polylineCoordinates.map((e) => e.longitude).reduce(min),
        ),
        northeast: LatLng(
          polylineCoordinates.map((e) => e.latitude).reduce(max),
          polylineCoordinates.map((e) => e.longitude).reduce(max),
        ),
      );

      mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));

      MapsLauncher.launchCoordinates(
        place.latLng.latitude,
        place.latLng.longitude,
        place.name,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Navigation started'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to get directions'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            onCameraMove: _onCameraMove,
            mapType: _currentMapType,
            markers: _markers.values.toSet(),
            polylines: _polylines,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.5),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_city, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Pasay City Map',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white.withOpacity(0.5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: DropdownButton<PlaceType>(
                              isExpanded: true,
                              value: _selectedPlaceType,
                              onChanged: _onPlaceTypeChanged,
                              items: [
                                DropdownMenuItem(value: null, child: Text('All Places')),
                                DropdownMenuItem(value: PlaceType.touristSpot, child: Text('Tourist Spots')),
                                DropdownMenuItem(value: PlaceType.accommodation, child: Text('Accommodations')),
                                DropdownMenuItem(value: PlaceType.foodAndBeverage, child: Text('Food & Beverage')),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Card(
                        color: Colors.white.withOpacity(0.5),
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: DropdownButton<MapType>(
                            value: _currentMapType,
                            onChanged: _onMapTypeChanged,
                            items: [
                              DropdownMenuItem(value: MapType.normal, child: Text('Normal')),
                              DropdownMenuItem(value: MapType.satellite, child: Text('Satellite')),
                              DropdownMenuItem(value: MapType.terrain, child: Text('Terrain')),
                              DropdownMenuItem(value: MapType.hybrid, child: Text('Hybrid')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Card(
                    color: Colors.white.withOpacity(0.5),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Marker Colors:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.place, color: Colors.red),
                              SizedBox(width: 4),
                              Text('Tourist Spots'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.place, color: Colors.deepPurple),
                              SizedBox(width: 4),
                              Text('Accommodations'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.place, color: Colors.orange),
                              SizedBox(width: 4),
                              Text('Food & Beverage'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: "currentLocationButton",
                      onPressed: _goToCurrentLocation,
                      backgroundColor: Colors.white, // Set background color here
                      child: Icon(
                        Icons.my_location,
                        color: Colors.blue, // Set icon color to blue
                      ),
                      tooltip: 'Current Location',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Place {
  final String name;
  final String address;
  final LatLng latLng;
  final PlaceType type;
  final String description;
  final String specialty;

  Place({
    required this.name,
    required this.address,
    required this.latLng,
    required this.type,
    required this.description,
    required this.specialty,
  });
}

enum PlaceType {
  touristSpot,
  accommodation,
  foodAndBeverage,
}

final List<Place> places = [
  // Tourist Spots
  Place(
    name: 'SM Mall of Asia (MOA)',
    address: 'Seaside Blvd, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5350, 120.9814),
    type: PlaceType.touristSpot,
    description: 'A major shopping mall offering shopping, dining, and entertainment.',
    specialty: 'Shopping, Dining, Entertainment, Sunset Viewing',
  ),
  Place(
    name: 'Star City',
    address: 'Vicente Sotto St. (near Roxas Blvd.), Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5615, 120.9897),
    type: PlaceType.touristSpot,
    description: 'An amusement park with rides, games, and attractions.',
    specialty: 'Amusement Park Rides and Games',
  ),
  Place(
    name: 'Resorts World Manila',
    address: 'Newport Boulevard, Newport City, Pasay, 1309 Metro Manila, Philippines',
    latLng: LatLng(14.5177, 121.0187),
    type: PlaceType.touristSpot,
    description: 'An integrated resort with casinos, hotels, shopping malls, and theaters.',
    specialty: 'Entertainment and Gambling',
  ),
  Place(
    name: 'City of Dreams Manila',
    address: 'Aseana Avenue, Entertainment City, Paranaque, 1701 Metro Manila, Philippines',
    latLng: LatLng(14.5281, 120.9795),
    type: PlaceType.touristSpot,
    description: 'A luxury integrated resort and casino complex.',
    specialty: 'Luxury Entertainment and Gaming',
  ),
  Place(
    name: 'Philippine International Convention Center (PICC)',
    address: 'CCP Complex, Roxas Blvd, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5594, 120.9831),
    type: PlaceType.touristSpot,
    description: 'The first international convention center in Asia.',
    specialty: 'Conferences and Events',
  ),
  Place(
    name: 'Cultural Center of the Philippines (CCP)',
    address: 'CCP Complex, Roxas Blvd, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5566, 120.9805),
    type: PlaceType.touristSpot,
    description: 'A center for the performing arts in the Philippines.',
    specialty: 'Performances and Cultural Events',
  ),
  Place(
    name: 'The Coconut Palace',
    address: 'CCP Complex, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5533, 120.9819),
    type: PlaceType.touristSpot,
    description: 'A government building known for its use of coconut as the primary material.',
    specialty: 'Cultural and Architectural Experience',
  ),
  Place(
    name: 'Manila Ocean Park',
    address: 'Luneta, Manila (near Pasay), Philippines',
    latLng: LatLng(14.5861, 120.9796),
    type: PlaceType.touristSpot,
    description: 'An oceanarium and marine theme park in Manila.',
    specialty: 'Marine Life Exhibits',
  ),
  Place(
    name: 'SM By the Bay Amusement Park',
    address: 'Seaside Blvd, SM Mall of Asia Complex, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5358, 120.9827),
    type: PlaceType.touristSpot,
    description: 'An outdoor amusement park by the Manila Bay.',
    specialty: 'Ferris Wheel and Bay Views',
  ),
  Place(
    name: 'Baclaran Church',
    address: 'Redemptorist Rd, Baclaran, Pasay, 1300 Metro Manila, Philippines',
    latLng: LatLng(14.5343, 120.9990),
    type: PlaceType.touristSpot,
    description: 'A famous Catholic church known for its weekly Novena.',
    specialty: 'Catholic Church and Pilgrimage',
  ),

  // Accommodations
  Place(
    name: 'Savoy Hotel Manila',
    address: '101 Andrews Ave, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5233, 121.0168),
    type: PlaceType.accommodation,
    description: 'A modern hotel with various room types and amenities.',
    specialty: 'Swimming pool, Fitness center, Free Wi-Fi, On-site restaurants',
  ),
  Place(
    name: 'Belmont Hotel Manila',
    address: 'Newport Blvd, Newport City, Pasay, 1309 Metro Manila',
    latLng: LatLng(14.5172, 121.0185),
    type: PlaceType.accommodation,
    description: 'A comfortable hotel with modern rooms and wellness facilities.',
    specialty: 'Outdoor swimming pool, Wellness and spa facilities, Free Wi-Fi',
  ),
  Place(
    name: 'Hotel101 Manila',
    address: 'EDSA Extension, Mall of Asia Complex, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5367, 120.9819),
    type: PlaceType.accommodation,
    description: 'A hotel offering comfortable rooms and convenient location.',
    specialty: 'Guest Rooms, Dining, Fitness Center',
  ),
  Place(
    name: 'Lime Resort Manila',
    address: 'Seascape Village, CCP Complex, Atang Dela Rama, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5433, 120.9799),
    type: PlaceType.accommodation,
    description: 'A resort with beach access and family-friendly amenities.',
    specialty: 'Beach Access, Kid\'s Club, Swimming Pool',
  ),
  Place(
    name: 'Golden Phoenix Hotel Manila',
    address: 'Oceanaire Bldg., CBP D. Macapagal, Sunrise Dr, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5360, 120.9934),
    type: PlaceType.accommodation,
    description: 'A hotel with business facilities and airport shuttle service.',
    specialty: 'Meeting Facilities, Airport Shuttle',
  ),
  Place(
    name: 'Lanson Place Mall of Asia, Manila',
    address: 'Mall of Asia Complex, Blk 12 Palm Coast Avenue, cor Seaside Blvd, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5348, 120.9836),
    type: PlaceType.accommodation,
    description: 'An upscale hotel with recreational facilities and dining options.',
    specialty: 'Dining, Recreational Facilities',
  ),
  Place(
    name: 'Kabayan Hotel',
    address: '423 Epifanio de los Santos Ave, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5371, 120.9984),
    type: PlaceType.accommodation,
    description: 'A budget-friendly hotel with basic amenities.',
    specialty: 'Parking, Laundry Services',
  ),
  Place(
    name: 'Courtyard Hotel',
    address: '24 Roxas Blvd. Corner Cuneta St. Pasay City, Manila',
    latLng: LatLng(14.5444, 120.9832),
    type: PlaceType.accommodation,
    description: 'A hotel offering meeting facilities and tour assistance.',
    specialty: 'Meeting Facilities, Safety and Security',
  ),
  Place(
    name: 'The Heritage Hotel Manila',
    address: 'Roxas Boulevard, corner Epifanio de los Santos Ave, Pasay, 1300 Metro Manila',
    latLng: LatLng(14.5396, 120.9835),
    type: PlaceType.accommodation,
    description: 'A luxury hotel with various amenities and services.',
    specialty: 'Shuttle Service, Luggage Storage',
  ),
  Place(
    name: 'Hilton Manila',
    address: '1 Newport Blvd, Pasay, 1309 Metro Manila',
    latLng: LatLng(14.5177, 121.0187),
    type: PlaceType.accommodation,
    description: 'A 5-star hotel offering luxurious accommodations and amenities.',
    specialty: 'Free parking, Free WiFi, Restaurant, Swimming Pool',
  ),

  // Food & Beverages
  Place(
    name: 'Spiral (Sofitel Philippine Plaza Manila)',
    address: 'CCP Complex, Roxas Boulevard, 1300 Pasay City, Philippines',
    latLng: LatLng(14.5353, 120.9811),
    type: PlaceType.foodAndBeverage,
    description: 'A luxurious buffet restaurant known for its wide range of international cuisines.',
    specialty: 'Cheese Room',
  ),
  Place(
    name: 'Sunset Bar (Sofitel Philippine Plaza Manila)',
    address: 'Sofitel Philippine Plaza, Roxas Blvd, Manila Bay Reclamation Area, Pasay',
    latLng: LatLng(14.5320, 120.9820),
    type: PlaceType.foodAndBeverage,
    description: 'An open-air restaurant offering a barbecue and scenic views of Manila Bay.',
    specialty: 'Sunset Barbecue',
  ),
  Place(
    name: 'The Alley by Vikings (SM Mall of Asia)',
    address: 'Ground Floor, SM Mall of Asia, Seaside Blvd, Pasay, Metro Manila',
    latLng: LatLng(14.5361, 120.9829),
    type: PlaceType.foodAndBeverage,
    description: 'A restaurant offering a variety of street food stations from around the world.',
    specialty: 'Global Street Food Stations',
  ),
  Place(
    name: 'Rico\'s Lechon (DoubleDragon Plaza)',
    address: 'Ground Floor, DoubleDragon Plaza, EDSA Extension, Pasay, Metro Manila',
    latLng: LatLng(14.5378, 120.9986),
    type: PlaceType.foodAndBeverage,
    description: 'A famous spot for authentic Cebu-style lechon.',
    specialty: 'Cebu-style Lechon',
  ),
  Place(
    name: 'Hong Kong Chef Seafood Restaurant (SM Mall of Asia)',
    address: 'Ground Floor, Entertainment Mall, SM Mall of Asia, Pasay, Metro Manila',
    latLng: LatLng(14.5379, 120.9843),
    type: PlaceType.foodAndBeverage,
    description: 'A popular seafood restaurant offering delicious dim sum and Cantonese specialties.',
    specialty: 'Steamed Shrimp Dumplings (Har Gow)',
  ),
  Place(
    name: 'Mesa Filipino Moderne (SM Mall of Asia)',
    address: 'Ground Floor, North Wing, SM Mall of Asia, Pasay, Metro Manila',
    latLng: LatLng(14.5360, 120.9830),
    type: PlaceType.foodAndBeverage,
    description: 'A modern Filipino restaurant offering traditional dishes with a twist.',
    specialty: 'Crispy Boneless Pata',
  ),
  Place(
    name: 'La Fiesta (SM by the Bay)',
    address: 'SM by the Bay, Seaside Blvd, Mall of Asia Complex, Pasay, Metro Manila',
    latLng: LatLng(14.5375, 120.9822),
    type: PlaceType.foodAndBeverage,
    description: 'A buffet-style restaurant with a dedicated Lechon carving station.',
    specialty: 'Lechon Carving Station',
  ),
  Place(
    name: 'Manila Life Café by Marriott (NAIA Terminal 3)',
    address: 'Level 4, NAIA Terminal 3, Andrews Ave, Pasay, Metro Manila',
    latLng: LatLng(14.5116, 121.0192),
    type: PlaceType.foodAndBeverage,
    description: 'A café offering delicious local and international fare.',
    specialty: 'Manila Fried Chicken',
  ),
  Place(
    name: 'Banzai: The Great Teppanyaki Theater (SM Mall of Asia)',
    address: 'Ground Floor, SM by the Bay, Mall of Asia Complex, Pasay, Metro Manila',
    latLng: LatLng(14.5365, 120.9838),
    type: PlaceType.foodAndBeverage,
    description: 'A teppanyaki-style grill and Japanese restaurant offering a unique dining experience.',
    specialty: 'Teppanyaki Grill',
  ),
  Place(
    name: 'XO 46 Heritage Bistro (SM Mall of Asia)',
    address: 'Ground Floor, S Maison, Conrad Manila, Seaside Blvd, Pasay, Metro Manila',
    latLng: LatLng(14.5337, 120.9815),
    type: PlaceType.foodAndBeverage,
    description: 'A Filipino bistro offering traditional Filipino dishes with a modern twist.',
    specialty: 'Crispy Tadyang ng Baka',
  ),
];