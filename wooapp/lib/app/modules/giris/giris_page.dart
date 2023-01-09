import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'giris_controller.dart';

class GirisPage extends GetView<GirisController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GirisPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Text(
                "${controller.sayi}",
                style: TextStyle(fontSize: 20),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  controller.arttir();
                },
                child: Text("Artti"))
          ],
        ),
      ),
    );
  }
}
