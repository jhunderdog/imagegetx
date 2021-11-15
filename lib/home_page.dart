import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:imagegetx/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text(" Home Page "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.imagePath.value == 'null'
                  ? const Center(
                      child: Text(
                        "Select Image from Camera/Gallery",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Image.file(File(controller.imagePath.value))),
              const SizedBox(
                height: 10.5,
              ),
              Obx(() => Text(
                  controller.imagePath.value == ''
                      ? ''
                      : controller.imageSize.value,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ))),
              const SizedBox(
                height: 10.5,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: const Text("Gallery"),
              ),
              const SizedBox(
                height: 10.5,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: const Text("Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
