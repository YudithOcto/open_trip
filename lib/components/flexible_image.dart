import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlexibleImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final BorderRadiusGeometry? radius;
  final BoxFit? boxFit;

  const FlexibleImage(
      {super.key,
      this.url,
      required this.width,
      required this.height,
      this.radius, this.boxFit,});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInCurve: Curves.easeInCirc,
      fadeInDuration: Duration.zero,
      imageUrl: url ?? "",
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: radius,
            image:
                DecorationImage(image: imageProvider, fit: boxFit)),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.blueGrey,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
