// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class image_catalog extends StatefulWidget {
  image_catalog(
      {Key? key, required this.image_location, required this.width_factor})
      : super(key: key);

  String image_location;
  double width_factor;

  @override
  _image_catalogState createState() => _image_catalogState();
}

class _image_catalogState extends State<image_catalog> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(widget.image_location),
      width: MediaQuery.of(context).size.width / widget.width_factor,
    );
  }
}
