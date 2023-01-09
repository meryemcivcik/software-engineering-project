import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:woapp/app/data/models/library_model.dart';

import '../../data/repositories/library_repository.dart';

class MapsController extends GetxController {
  

  LibraryRepository get libraryRepository => Get.find();

  var listOfLibraries = <LibraryModel>[].obs;
  var max_index = 0.obs; 
  int i = 0;

  var kGooglePlexMarker = Marker(markerId: MarkerId("kGooglePlexMarker")).obs;
  var kGooglePlexMarker1 = Marker(markerId: MarkerId("kGooglePlexMarker1")).obs;
  var kGooglePlexMarker2 = Marker(markerId: MarkerId("kGooglePlexMarker2")).obs;
  var kGooglePlexMarker3 = Marker(markerId: MarkerId("kGooglePlexMarker2")).obs; //Kullanıcı

  Future<void> getLib() async {
    listOfLibraries.value = await libraryRepository.getLocations();
    listOfLibraries.forEach((element) {
      print(element.capacity);
    });

    var firstLong = double.parse(listOfLibraries.value[0].long.toString());
    var firstLat = double.parse(listOfLibraries.value[0].lat.toString());

    var secondlong = double.parse(listOfLibraries.value[1].long.toString());
    var secondlat = double.parse(listOfLibraries.value[1].lat.toString());

    var thirdlong = double.parse(listOfLibraries.value[2].long.toString());
    var thirdlat = double.parse(listOfLibraries.value[2].lat.toString());

    kGooglePlexMarker.value = Marker(
        markerId: MarkerId("kGooglePlexMarker"),
        // ignore: prefer_const_constructors
        infoWindow: InfoWindow(title: ""),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(firstLat, firstLong));

    kGooglePlexMarker1.value = Marker(
        markerId: MarkerId("kGooglePlexMarker1"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(secondlat, secondlong));

    kGooglePlexMarker2.value = Marker(
        markerId: MarkerId("kGooglePlexMarker2"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(thirdlat, thirdlong));
     kGooglePlexMarker3.value = Marker(
        markerId: MarkerId("kGooglePlexMarker3"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(41047194, 29.061684));

    CameraPosition firstLocation = CameraPosition(
      bearing: 10.0,
      target: LatLng(firstLat, firstLong),
      zoom: 10,
    );
    final GoogleMapController controller = await mapController.value.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(firstLocation));
  }

  Future<void> setLib() async {
   
    await libraryRepository.changeLibraryStatus(listOfLibraries.value.first);
   
  }
  
  var mapController = Completer().obs;
  var flag = true.obs;
  

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
    
  );

  Future<void> goToTheLake() async {
    

    CameraPosition kLake = const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    final GoogleMapController controller = await mapController.value.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  

  @override
  void onInit() async {
    super.onInit();
    await getLib();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  LibraryModel getirEnMusait() {
    var konum0 = double.parse(listOfLibraries.value[0].capacity!);
    var konum1 = double.parse(listOfLibraries.value[1].capacity!);
    var konum2 = double.parse(listOfLibraries.value[2].capacity!);

    if (konum0 > konum1 && konum2 > konum1) {
      return listOfLibraries.value[1];
    } else if (konum0 > konum2 && konum1 > konum2) {
      return listOfLibraries.value[2];
    } else if (konum1 > konum0 && konum2 > konum0) {
      return listOfLibraries.value[0];
    }

    return LibraryModel();
  }

  Color renkgetir(int index) {
    if (double.parse(listOfLibraries.value[index].capacity!) < 30.0) {
      return Colors.greenAccent;
    } else if (double.parse(listOfLibraries.value[index].capacity!) > 30.0 &&
        double.parse(listOfLibraries.value[index].capacity!) < 60.0) {
      return Colors.yellowAccent;
    } else {
      return Colors.redAccent;
    }
  }

  void pop_up() {
    if (flag.value == false) {
      flag.value = true;
    } else {
      flag.value = false;
    }
  }
}
