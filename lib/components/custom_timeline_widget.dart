import 'package:flutter/material.dart';
import 'package:opentripapp/components/custom_text_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineWidget extends StatelessWidget {
  final bool? isFirst;
  final bool? isLast;
  final String title;
  final String? subtitle;
  const CustomTimelineWidget(
      {super.key,
      this.isFirst,
      this.isLast,
      required this.title,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
      beforeLineStyle: const LineStyle(thickness: 1.0),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: CustomTextStyle.body3.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 4.0),
            Text(subtitle ?? "",
                style: CustomTextStyle.caption1.copyWith(color: Colors.grey)),
          ],
        ),
      ),
      indicatorStyle: IndicatorStyle(
        width: 14.0,
        drawGap: true,
        indicator: Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.grey,
              ),
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
