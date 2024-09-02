import 'package:flutter/material.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_title_value_widget.dart';

class TripDetailQuickInfoWidget extends StatelessWidget {
  final String date;
  final String location;
  final double rating;
  final int totalRating;
  const TripDetailQuickInfoWidget({super.key, required this.date, required this.location, required this.rating, required this.totalRating});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TripDetailTitleValueWidget(
                  title: "Location",
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 12.0,
                  ),
                  value: location),
            ),
            Expanded(
              child: TripDetailTitleValueWidget(
                  title: "Rating",
                  icon: const Icon(
                    Icons.rate_review,
                    color: Colors.amber,
                    size: 12.0,
                  ),
                  value: "$rating ($totalRating+ review)"),
            ),
            Expanded(
              child: TripDetailTitleValueWidget(
                  title: "Date",
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.indigo,
                    size: 12.0,
                  ),
                  value: date),
            ),
          ],
        ),
      ),
    );
  }
}
