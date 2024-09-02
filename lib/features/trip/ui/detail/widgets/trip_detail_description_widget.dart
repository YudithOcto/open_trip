import 'package:flutter/material.dart';
import 'package:opentripapp/components/custom_text_style.dart';

class TripDetailDescriptionWidget extends StatelessWidget {
  final String text;
  const TripDetailDescriptionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: CustomTextStyle.body3
            .copyWith(fontWeight: FontWeight.w100, color: Colors.grey),
      ),
    );
  }
}
