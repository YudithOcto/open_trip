import 'package:flutter/material.dart';
import 'package:opentripapp/components/custom_text_style.dart';
import 'package:opentripapp/components/custom_timeline_widget.dart';

class TripDetailItinerary extends StatelessWidget {
  final Map<String, String> items;
  const TripDetailItinerary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Itinerary",
             style: CustomTextStyle.body2.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8.0),
          ...items.entries.toList().asMap().entries.map((entry) {
            int index = entry.key; 
            MapEntry item = entry.value; 
    
            bool isFirst = index == 0;
            bool isLast = index == items.length - 1;
    
            return CustomTimelineWidget(
              isFirst: isFirst,
              isLast: isLast,
              title: item.key,
              subtitle: item.value,
            );
          }),
        ],
      ),
    );
  }
}
