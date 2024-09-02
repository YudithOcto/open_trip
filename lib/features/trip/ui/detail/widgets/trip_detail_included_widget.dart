import 'package:flutter/material.dart';
import 'package:opentripapp/components/custom_text_style.dart';

class TripDetailIncludedWidget extends StatelessWidget {
  final List<String> items;
  const TripDetailIncludedWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's Included",
            style: CustomTextStyle.body2.copyWith(color: Colors.black),
          ),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "• $item",
                style: CustomTextStyle.caption1.copyWith(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
