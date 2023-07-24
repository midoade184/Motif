// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';
import 'package:motif/pages/product_page/product_page_widget.dart';

class CustomProductCarousel extends StatefulWidget {
  const CustomProductCarousel({
    Key? key,
    this.width,
    this.height,
    this.gallery,
    this.imageWidth,
    this.imageHeight,
    this.isBanner,
    this.mainImage,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<dynamic>? gallery;
  final double? imageWidth;
  final double? imageHeight;
  final bool? isBanner;
  final String? mainImage;

  @override
  _CustomProductCarouselState createState() => _CustomProductCarouselState();
}

final List<String> emptyList = [
  'https://motifeg.com/wp-content/uploads/2023/02/not-loaded-scaled.webp'
];

class _CustomProductCarouselState extends State<CustomProductCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll:
              this.widget.isBanner == null || !this.widget.isBanner!
                  ? false
                  : true,
          autoPlay: true,
        ),
        items: this.widget.gallery!.contains(false) ||
                this.widget.gallery == [] ||
                this.widget.gallery!.isEmpty ||
                this.widget.gallery == null
            ? [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        '${this.widget.mainImage}',
                        width: this.widget.imageWidth,
                        height: this.widget.imageHeight,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                )
              ]
            : this
                .widget
                .gallery!
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        // onTap: () async {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => ProductPageWidget(
                        //           id: e['product_id'],
                        //           discount: e['product_discount'])),
                        // );
                        // },
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              this.widget.isBanner == true ? e['image'] : e,
                              width: 1050,
                              height: 350,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
      ),
    );
  }
}
