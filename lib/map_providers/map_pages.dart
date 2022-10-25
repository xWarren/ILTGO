import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart' hide Location;
import 'package:iltgo/map_providers/search.dart';
import 'package:location/location.dart';
import '../pages/main_pages.dart';
import 'services.dart';

//To read providers
class MapPages extends ConsumerStatefulWidget {
  const MapPages({Key? key}) : super(key: key);

  @override
  _MapPagesState createState() => _MapPagesState();
}

class _MapPagesState extends ConsumerState<MapPages> {
  final menustyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);

  late GoogleMapController _controller;

  var height = 200.0;
  var width = 200.0;

  //Function for Origin and Destination
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  DetailsResult? originPosition;
  DetailsResult? destinationPosition;
  DetailsResult? searchPosition;

  late FocusNode originFocusNode;
  late FocusNode destinationFocusNode;
  late FocusNode searchFocusNode;

  //To prevent search from happening so fast
  Timer? _debounce;
  //Toggling UI
  bool searchToggle = true;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;

  //Markers set
  Set<Marker> _markers = Set<Marker>();

  //Polylines set
  Set<Polyline> _polylines = Set<Polyline>();
  int markerIdCounter = 1;
  int polylineIdCounter = 1;

  var radiusValue = 3000.0;

  var tappedPoint;

  List allFavoritePlaces = [];

  String tokenKey = '';

  //Page controller for the pageview
  late PageController _pageController;
  int prevPage = 0;
  var tappedPlaceDetail;
  String placeImg = '';
  var photoGalleryIndex = 0;
  bool showBlankCard = false;

  final key = 'AIzaSyAyBh1oNe0wqgv4NBQ3AjbxGYIh5mvl9YU';

  var selectedPlaceDetails;

  //Circle
  Set<Circle> _circles = Set<Circle>();

  //Text Editing Controllers
  TextEditingController searchController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  //Map position when load
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late LocationData currentLocation;

  void _onMapCreated(GoogleMapController _cntlr) async {
    Location location = Location();
    _controller = _cntlr;
    location.getLocation().then((location) {
      currentLocation = location;
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target:
                  LatLng(currentLocation.latitude!, currentLocation.longitude!),
              zoom: 15),
        ),
      );
    });
  }

  void _setMarker(point) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);

    setState(() {
      _markers.add(marker);
    });
  }

  //Setting a polyline
  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdValue = 'polyline_$polylineIdCounter';

    polylineIdCounter++;

    _polylines.add(Polyline(
        polylineId: PolylineId(polylineIdValue),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
  }

  void _setCircle(LatLng point) async {
    final GoogleMapController controller = await _controller;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 12)));
    setState(() {
      _circles.add(Circle(
        circleId: const CircleId('raj'),
        center: point,
        fillColor: Colors.blue.withOpacity(0.1),
        radius: radiusValue,
        strokeColor: Colors.blue.shade100,
        strokeWidth: 1,
      ));
      getDirections = false;
      searchToggle = false;
      radiusSlider = true;
    });
  }

  _setNearMarker(LatLng point, String label, List types, String address) async {
    var counter = markerIdCounter++;

    final Uint8List markerIcon;

    //if (types.contains('government')) {
    //markerIcon =
    // await getBytesFromAsset('assets/mapicons/', 75);
    //} else if (types.contains('driving Schools')) {
    //  markerIcon =
    //   await getBytesFromAsset('assets/mapicons/', 75);
    //} else {
    //  markerIcon = await getBytesFromAsset('assets/mapicons/government.png', 75);
    // }

    final Marker marker = Marker(
      markerId: MarkerId('marker_$counter'),
      position: point,
      onTap: () {},
      // icon: BitmapDescriptor.fromBytes(markerIcon)
    );

    setState(() {
      _markers.add(marker);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 1, viewportFraction: 0.85)
      ..addListener(_onScroll);
    super.initState();
    googlePlace = GooglePlace(key);

    originFocusNode = FocusNode();
    destinationFocusNode = FocusNode();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    originFocusNode.dispose();
    destinationFocusNode.dispose();
    searchFocusNode.dispose();
  }

  void OriDesAutoCompleteSearch(String values) async {
    var result = await googlePlace.autocomplete.get(values);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      cardTapped = false;
      photoGalleryIndex = 1;
      showBlankCard = false;
      goToTappedPlace();
      fetchImage();
    }
  }

  //Fetch image to place inside the tile in the pageView
  void fetchImage() async {
    if (_pageController.page != null) {
      if (allFavoritePlaces[_pageController.page!.toInt()]['photos'] != null) {
        setState(() {
          placeImg = allFavoritePlaces[_pageController.page!.toInt()]['photos']
              [0]['photo_reference'];
        });
      } else {
        placeImg = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    //Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: _markers,
                    polylines: _polylines,
                    circles: _circles,
                    initialCameraPosition: CameraPosition(
                        target: _initialcameraposition, zoom: 13.5),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    onMapCreated: _onMapCreated,
                    onTap: (point) {
                      tappedPoint = point;
                      _setCircle(point);
                    },
                  ),
                ),
                searchToggle
                    ? Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: false,
                              focusNode: searchFocusNode,
                              controller: searchController,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search',
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    var directions =
                                        await MapServices().getDirections(
                                      searchController.text,
                                      searchController.text,
                                    );
                                    _markers = {};
                                    _polylines = {};
                                    predictions = [];
                                    gotoPlaces(
                                      directions['start_location']['lat'],
                                      directions['start_location']['lng'],
                                      directions['end_location']['lat'],
                                      directions['end_location']['lng'],
                                      directions['bounds_ne'],
                                      directions['bounds_sw'],
                                    );
                                    _setPolyline(
                                        directions['polyline_decoded']);
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                              ),
                              onChanged: (value) {
                                if (_debounce?.isActive ?? false)
                                  _debounce!.cancel();
                                _debounce =
                                    Timer(Duration(milliseconds: 1000), () {
                                  if (value.isNotEmpty) {
                                    OriDesAutoCompleteSearch(value);
                                  } else {
                                    setState(() {
                                      predictions = [];
                                      searchPosition = null;
                                      _markers = {};
                                    });
                                  }
                                });
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: predictions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.green,
                                          )),
                                      title: Text(
                                        predictions[index]
                                            .description
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      onTap: () async {
                                        final placeId =
                                            predictions[index].placeId!;
                                        final details = await googlePlace
                                            .details
                                            .get(placeId);
                                        if (details != null &&
                                            details.result != null &&
                                            mounted) {
                                          if (searchFocusNode.hasFocus) {
                                            setState(() {
                                              searchPosition = details.result;
                                              searchController.text =
                                                  details.result!.name!;
                                              predictions = [];
                                            });
                                          }
                                          if (searchPosition != null) {
                                            print('navigate');
                                          }
                                        }
                                      },
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                getDirections
                    ? Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
                        child: Column(children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: originController,
                              focusNode: originFocusNode,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                                border: InputBorder.none,
                                hintText: 'Origin',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                              ),
                              onChanged: (values) {
                                if (_debounce?.isActive ?? false)
                                  _debounce!.cancel();
                                _debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  if (values.isNotEmpty) {
                                    OriDesAutoCompleteSearch(values);
                                  } else {
                                    setState(() {
                                      predictions = [];
                                      originPosition = null;
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: destinationController,
                              focusNode: destinationFocusNode,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 15.0,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Destination',
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  suffixIcon: SizedBox(
                                    width: 96.0,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              var directions =
                                                  await MapServices()
                                                      .getDirections(
                                                          originController.text,
                                                          destinationController
                                                              .text);
                                              _markers = {};
                                              _polylines = {};
                                              predictions = [];
                                              gotoPlace(
                                                directions['start_location']
                                                    ['lat'],
                                                directions['start_location']
                                                    ['lng'],
                                                directions['end_location']
                                                    ['lat'],
                                                directions['end_location']
                                                    ['lng'],
                                                directions['bounds_ne'],
                                                directions['bounds_sw'],
                                              );
                                              _setPolyline(directions[
                                                  'polyline_decoded']);
                                            },
                                            icon: const Icon(Icons.search)),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                getDirections = false;
                                                originController.text = '';
                                                destinationController.text = '';
                                                _markers = {};
                                                _polylines = {};
                                              });
                                            },
                                            icon: const Icon(Icons.close)),
                                      ],
                                    ),
                                  )),
                              onChanged: (values) {
                                if (_debounce?.isActive ?? false)
                                  _debounce!.cancel();
                                _debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  if (values.isNotEmpty) {
                                    OriDesAutoCompleteSearch(values);
                                  } else {
                                    setState(() {
                                      predictions = [];
                                      destinationPosition = null;
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: predictions.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      predictions[index].description.toString(),
                                    ),
                                    onTap: () async {
                                      final placeId =
                                          predictions[index].placeId!;
                                      final details = await googlePlace.details
                                          .get(placeId);
                                      if (details != null &&
                                          details.result != null &&
                                          mounted) {
                                        if (originFocusNode.hasFocus) {
                                          setState(() {
                                            originPosition = details.result;
                                            originController.text =
                                                details.result!.name!;
                                            predictions = [];
                                          });
                                        } else {
                                          setState(() {
                                            destinationPosition =
                                                details.result;
                                            destinationController.text =
                                                details.result!.name!;
                                            predictions = [];
                                          });
                                          if (originPosition != null &&
                                              destinationPosition != null) {
                                            print('navigate');
                                          }
                                        }
                                      }
                                    },
                                  );
                                }),
                          ),
                        ]),
                      )
                    : Container(),
                radiusSlider
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 0.0),
                        child: Container(
                          height: 50.0,
                          color: Colors.black.withOpacity(0.3),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Slider(
                                      max: 7000.0,
                                      min: 1000.0,
                                      value: radiusValue,
                                      onChanged: (newVal) {
                                        radiusValue = newVal;
                                        pressedNear = false;
                                        _setCircle(tappedPoint);
                                      })),
                              !pressedNear
                                  ? IconButton(
                                      onPressed: () {
                                        if (_debounce?.isActive ?? false) {
                                          _debounce?.cancel();
                                        }
                                        _debounce =
                                            Timer(const Duration(seconds: 2),
                                                () async {
                                          var placesResult = await MapServices()
                                              .getPlaceDetails(
                                            tappedPoint,
                                            radiusValue.toInt(),
                                          );
                                          List<dynamic> placesWithin =
                                              placesResult['results'] as List;

                                          allFavoritePlaces = placesWithin;
                                          tokenKey =
                                              placesResult['next_page_token'] ??
                                                  'none';
                                          _markers = {};
                                          placesWithin.forEach((element) {
                                            _setNearMarker(
                                              LatLng(
                                                element['geometry']['location']
                                                    ['lat'],
                                                element['geometry']['location']
                                                    ['lng'],
                                              ),
                                              element['name'],
                                              element['types'],
                                              element['formatted_address'] ??
                                                  'not available',
                                            );
                                          });
                                          _markers;
                                          pressedNear = true;
                                        });
                                      },
                                      icon: const Icon(Icons.near_me),
                                      color: Colors.blue,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        if (_debounce?.isActive ?? false) {
                                          _debounce?.cancel();
                                        }
                                        _debounce =
                                            Timer(const Duration(seconds: 2),
                                                () async {
                                          if (tokenKey != 'none') {
                                            var placesResult =
                                                await MapServices()
                                                    .getMorePlaceDetails(
                                              tokenKey,
                                              tappedPoint,
                                              radiusValue.toInt(),
                                            );

                                            List<dynamic> placesWithin =
                                                placesResult['results'] as List;
                                            allFavoritePlaces
                                                .addAll(placesWithin);

                                            tokenKey = placesResult[
                                                    'next_page_token'] ??
                                                'none';

                                            placesWithin.forEach((element) {
                                              _setNearMarker(
                                                LatLng(
                                                  element['geometry']
                                                      ['location']['lat'],
                                                  element['geometry']
                                                      ['location']['lng'],
                                                ),
                                                element['name'],
                                                element['types'],
                                                element['formatted_address'] ??
                                                    'not available',
                                              );
                                            });
                                          } else {
                                            const Visibility(
                                              visible: false,
                                              child: Icon(Icons.near_me,
                                                  color: Colors.red),
                                            );
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.near_me,
                                          color: Colors.red)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      radiusSlider = false;
                                      pressedNear = false;
                                      cardTapped = false;
                                      radiusValue = 3000.0;
                                      _circles = {};
                                      _markers = {};
                                      allFavoritePlaces = [];
                                    });
                                  },
                                  icon: const Icon(Icons.close,
                                      color: Colors.red))
                            ],
                          ),
                        ),
                      )
                    : Container(),
                pressedNear
                    ? Positioned(
                        bottom: 20.0,
                        child: Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: allFavoritePlaces.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _nearbyPlacesList(index);
                            },
                          ),
                        ))
                    : Container(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomLeft,
        fabColor: Colors.blueAccent,
        fabOpenColor: Colors.red,
        ringDiameter: 200.0,
        ringWidth: 60.0,
        ringColor: Colors.blue.shade100,
        fabSize: 60.0,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchToggle = true;
                  radiusSlider = false;
                  pressedNear = false;
                  cardTapped = false;
                  getDirections = false;
                });
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  searchToggle = false;
                  radiusSlider = false;
                  pressedNear = false;
                  cardTapped = false;
                  getDirections = true;
                });
              },
              icon: const Icon(Icons.navigation)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPages()));
                setState(() {});
              },
              icon: Icon(Icons.home)),
        ],
      ),
    );
  }

  gotoPlace(double lat, double lng, double endLat, double endLng,
      Map<String, dynamic> boundsNe, Map<String, dynamic> boundsSw) async {
    final GoogleMapController controller = await _controller;

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng'])),
        25));

    _setMarker(LatLng(lat, lng));
    _setMarker(LatLng(endLat, endLng));
  }

  gotoPlaces(double lat, double lng, double endLat, double endLng,
      Map<String, dynamic> boundsNe, Map<String, dynamic> boundsSw) async {
    final GoogleMapController controller = await _controller;

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng'])),
        20));

    _setMarker(LatLng(lat, lng));
    _setMarker(LatLng(endLat, endLng));
  }

  _nearbyPlacesList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () async {
          cardTapped = !cardTapped;
          if (cardTapped) {
            tappedPlaceDetail = await MapServices()
                .getPlaces(allFavoritePlaces[index]['place_id']);
            setState(() {});
          }
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 1.0,
                  vertical: 1.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        _pageController.position.haveDimensions
                            ? _pageController.page!.toInt() == index
                                ? Container(
                                    height: 130.0,
                                    width: 90.0,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(placeImg != ''
                                                ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$placeImg&key=$key'
                                                : 'https://i.ibb.co/CWY3qMy/no-image.png'),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
                                    height: 100.0,
                                    width: 10.0,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),
                                        color: Colors.blue),
                                  )
                            : Container(),
                        const SizedBox(width: 5.0),
                        cardTapped
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
                                      allFavoritePlaces[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 140.0,
                                    child: Text(
                                      tappedPlaceDetail['formatted_address'],
                                      style: const TextStyle(
                                          fontSize: 11.0,
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToTappedPlace() async {
    final GoogleMapController controller = await _controller;

    _markers = {};

    var selectedPlace = allFavoritePlaces[_pageController.page!.toInt()];

    _setNearMarker(
        LatLng(
          selectedPlace['geometry']['location']['lat'],
          selectedPlace['geometry']['location']['lng'],
        ),
        selectedPlace['name'] ?? 'no name',
        selectedPlace['types'],
        selectedPlace['formatted_address'] ?? 'none');

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        selectedPlace['geometry']['location']['lat'],
        selectedPlace['geometry']['location']['lng'],
      ),
      zoom: 14.0,
      bearing: 45.0,
      tilt: 45.0,
    )));
  }

  Future<void> gotoSearchedPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controller;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15)));
  }

  setupAlertDialoadContainer() {}
}
