import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opentripapp/components/custom_text_style.dart';
import 'package:opentripapp/components/flexible_image.dart';

class TripDetailHeaderWidget extends StatelessWidget {
  final String title;
  final String image;
  const TripDetailHeaderWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: image,
          child: FlexibleImage(
            url: image,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.35,
            boxFit: BoxFit.cover,
            radius: const BorderRadius.only(
              bottomLeft: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black.withOpacity(0.2),
                  ],
                  stops: const [
                    0.0,
                    0.5
                  ]),
            ),
          ),
        ),
        Positioned(
          top: 48.0,
          left: 16.0,
          child: InkWell(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 22.0,
              ),
            ),
          ),
        ),
        Positioned(
          top: 42.0,
          left: 60.0,
          right: 60.0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: CustomTextStyle.headline3.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
