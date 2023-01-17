import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapsScreen extends StatefulWidget {
  
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
   final Completer<GoogleMapController>_controller=Completer();
   MapType mapType =MapType.normal;
   
  @override
  Widget build(BuildContext context) {
    final ScanModel scan= ModalRoute.of(context)!.settings.arguments as ScanModel;
   final CameraPosition initPoint= CameraPosition(
    target: scan.getLatLng(),
     zoom:17.5);
     
     
     //Marcadores
  Set <Marker> markers=new Set<Marker>();
  markers.add(new Marker
  (
    markerId: MarkerId('geo-Location'),
    position:scan.getLatLng()
    )
    );

   
   return Scaffold(
    appBar: AppBar(
      title:const Text('Coordinates'),
      actions: [
        IconButton(
          onPressed: ()async{
            final GoogleMapController controller=await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: scan.getLatLng(),zoom: 17.5,tilt:50)));
          },
           icon: Icon(Icons.location_disabled))
      ],
    ),
      body: GoogleMap(
          markers: markers,
          mapType: mapType,
          initialCameraPosition: initPoint,
          onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: null,
          onPressed:(){
              if (mapType==MapType.normal){
                mapType=MapType.satellite;
              }
              else if (mapType==MapType.satellite){
                mapType=MapType.hybrid;
              }
                else{
                  mapType=MapType.normal;
                }
                //Para que se redibuje el widget
              setState(() {
                
              });
              },
          
          child: Icon(Icons.layers), ),
        floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterFloat,
   );
  }
}