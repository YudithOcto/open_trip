import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opentripapp/components/custom_loading.dart';
import 'package:opentripapp/components/custom_text_style.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';
import 'package:opentripapp/features/trip/ui/controller/trip_controller.dart';
import 'package:opentripapp/features/trip/ui/detail/trip_detail_screen.dart';
import 'package:opentripapp/utils/currency_format.dart';

import '../../../../components/flexible_image.dart';

class TripListScreen extends StatefulWidget {
  const TripListScreen({super.key});

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {
  final _tripController = Get.put(TripController(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Discover Trip",
          style: CustomTextStyle.headline2,
        ),
      ),
      body: Obx(() {
        if (_tripController.isLoading) {
          return const Center(child: CustomLoading());
        } else {
          return ListView.builder(
            restorationId: "trip_list",
            itemCount: _tripController.trips.length,
            itemBuilder: (context, index) {
              final trip = _tripController.trips[index];
              return InkWell(
                  onTap: () {
                    Get.to(TripDetailScreen(tripSpec: trip));
                  },
                  child: TripItemWidget(trip: trip));
            },
          );
        }
      }),
    );
  }
}

class TripItemWidget extends StatelessWidget {
  final TripSpec trip;
  const TripItemWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Hero(
                  tag: trip.image,
                  child: FlexibleImage(
                    url: trip.image,
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.15,
                    boxFit: BoxFit.fitWidth,
                    radius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.orange, size: 14.0),
                        const SizedBox(width: 4.0),
                        Text("${trip.review} (${trip.totalReview})",
                            style: CustomTextStyle.caption1
                                .copyWith(color: Colors.black))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.name,
                    style: CustomTextStyle.body2.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  RowInformationWidget(
                    prefixIcon: IconCircleBackground(
                        circleColor: Colors.red.withOpacity(0.2),
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 12.0,
                        )),
                    text: trip.location,
                    textStyle:
                        CustomTextStyle.caption1.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4.0),
                  RowInformationWidget(
                    prefixIcon: IconCircleBackground(
                        circleColor: Colors.green.withOpacity(0.2),
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.green,
                          size: 12.0,
                        )),
                    text: trip.date,
                    textStyle:
                        CustomTextStyle.caption1.copyWith(color: Colors.grey),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        Visibility(
                          visible: trip.priceBeforeDiscount > 0.0,
                          child: Text(
                              CurrencyFormat.formatToRupiah(
                                  trip.priceBeforeDiscount),
                              textAlign: TextAlign.end,
                              style: CustomTextStyle.caption2.copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          CurrencyFormat.formatToRupiah(trip.price),
                          textAlign: TextAlign.end,
                          style:
                              CustomTextStyle.body3.copyWith(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowInformationWidget extends StatelessWidget {
  final Widget prefixIcon;
  final String text;
  final TextStyle? textStyle;

  const RowInformationWidget(
      {super.key,
      required this.prefixIcon,
      required this.text,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefixIcon,
        const SizedBox(width: 4.0),
        Text(text, style: textStyle ?? CustomTextStyle.caption1)
      ],
    );
  }
}

class IconCircleBackground extends StatelessWidget {
  final Color circleColor;
  final Icon icon;
  const IconCircleBackground(
      {super.key, required this.circleColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: icon,
      ),
    );
  }
}
