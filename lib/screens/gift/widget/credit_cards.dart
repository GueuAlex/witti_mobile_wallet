import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GiftCards extends StatelessWidget {
  const GiftCards({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 175.0,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        //height: height,
        // viewportFraction: 1.0,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: 1,
        viewportFraction: 0.9,
        aspectRatio: 0.0,
        enlargeFactor: 0.15,
      ),
      items: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(13.0),
            image: const DecorationImage(
              image: AssetImage('assets/images/gift.webp'),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset.zero,
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ],
    );
  }
}
