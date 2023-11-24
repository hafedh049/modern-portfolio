import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:professional_dark_personal_portfolio/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyPosition extends StatefulWidget {
  const MyPosition({super.key});

  @override
  State<MyPosition> createState() => _MyPositionState();
}

class _MyPositionState extends State<MyPosition> {
  final MapController mapController = MapController();
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  bool plus = false, minus = false;

  final markers = <Marker>[
    Marker(
      width: 80,
      height: 80,
      point: LatLng(36.5382336, 10.5488656),
      builder: (BuildContext ctx) => const Icon(
        FontAwesomeIcons.locationDot,
        color: Colors.red,
        size: 30,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  absorbPanEventsOnScrollables: true,
                  interactiveFlags: InteractiveFlag.all,
                  slideOnBoundaries: true,
                  enableMultiFingerGestureRace: true,
                  keepAlive: true,
                  /* does not rebuild  */
                  enableScrollWheel: true,
                  center: LatLng(36.5382336, 10.5488656),
                  zoom: 18,
                  onTap: (tapPosition, LatLng point) async {
                    if (point.latitude == 36.5382336 && point.latitude == 10.5488656) {
                      await launchUrlString("https://www.google.com/maps/@36.5382336,10.5488656,19.5z");
                    }
                  },
                ),
                nonRotatedChildren: <Widget>[
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: () async {
                      await launchUrlString("https://www.google.com/maps/@36.5382336,10.5488656,19.5z");
                    },
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: markers),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Tooltip(
                        message: "Zoom-In",
                        child: StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return InkWell(
                              onTap: () => mapController.move(mapController.center, mapController.zoom + .1),
                              onHover: (bool state) => _(() => plus = state),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 25,
                                  color: plus ? progressbarColor : backgroundColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Tooltip(
                        message: "Zoom-Out",
                        child: StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return InkWell(
                              onTap: () => mapController.move(mapController.center, mapController.zoom - .1),
                              onHover: (bool state) => _(() => minus = state),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 25,
                                  color: minus ? progressbarColor : backgroundColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
