import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' show Dio, Response;

import '../models/image_model.dart';
import '../widgets/image_list.dart';

class ImageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageScreenState();
  }
}

class ImageScreenState extends State<ImageScreen> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response;
    try {
      response = await Dio()
          .get('https://jsonplaceholder.typicode.com/photos/$counter');
      print(response);
    } catch (e) {
      print(e);
    }
    final imageModel = ImageModel.fromJson(response.data);
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BunnyBear'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: fetchImage,
        ),
        body: ImageList(images),
      ),
    );
  }
}
