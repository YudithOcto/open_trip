import 'package:flutter/material.dart';
import 'package:opentripapp/components/custom_text_style.dart';

class TripDetailTitleValueWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String value;
  const TripDetailTitleValueWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.body2.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            icon,
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                value,
                style: CustomTextStyle.caption1
                    .copyWith(color: Colors.grey.shade500),
              ),
            ),
          ],
        )
      ],
    );
  }
}
