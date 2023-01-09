import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'maps_controller.dart';



class MapsPage extends GetView<MapsController> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Getir"),
        icon: Icon(Icons.search),
        onPressed: () async {
         await controller.getLib();
          controller.pop_up();
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          
          Stack(
            children: [
             

              Obx(() {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GoogleMap(
                    markers: {
                      controller.kGooglePlexMarker.value,
                      controller.kGooglePlexMarker1.value,
                      controller.kGooglePlexMarker2.value,
                    }, 
                    mapType: MapType.normal, 
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: (GoogleMapController googleMapController) {
                      controller.mapController.value
                          .complete(googleMapController);
                    },
                  ),
                );
              }),

              
              Obx(() {
                return Visibility(
                  visible: controller.flag.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 3),
                      
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "En yakin konum",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Container(
                                     
                                      
                                      decoration: BoxDecoration(
                                      
                                          color: controller.renkgetir(int.parse(controller.getirEnMusait().id!)-1),
                                          border: Border.all(
                                              color: controller.renkgetir(int.parse(controller.getirEnMusait().id!)-1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: ListTile(
                                        leading: Text(
                                          """%${controller.getirEnMusait().capacity}""",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        title: Text("""MKM Kultur Merkezi 0.75km
                                             """),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text("Diğer yakin konumlar:",
                                        style: TextStyle(fontSize: 20)),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      itemBuilder: (context, index) => Container(
                                        margin: EdgeInsets.all(8.0),
                                        padding: EdgeInsets.only(bottom: 12),
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                              color: controller
                                                  .renkgetir(index),
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: ListTile(
                                              leading: Text(
                                                  """%${controller.listOfLibraries.value[index].capacity}""",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              title: Text( index ==1?  """ Metehan Kütüphanesi
                                              """:
                                                  """ Yavuz Sultan Selim Kütüphanesi
                                              """),
                                              )),
                                              
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                  ),
                );
              })
            ],
          )
        ],
      ),

      
    );
  }
}
