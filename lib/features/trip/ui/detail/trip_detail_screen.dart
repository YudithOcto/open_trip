import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opentripapp/components/custom_text_style.dart';
import 'package:opentripapp/components/sliver_sticky_header_delegate.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';
import 'package:opentripapp/features/trip/ui/controller/trip_controller.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_description_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_excluded_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_header_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_included_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_itenerary_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_quick_info_widget.dart';
import 'package:opentripapp/features/trip/ui/detail/widgets/trip_detail_tnc_widget.dart';
import 'package:opentripapp/utils/currency_format.dart';

class TripDetailScreen extends StatefulWidget {
  final TripSpec tripSpec;
  const TripDetailScreen({super.key, required this.tripSpec});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  final TripController _tripController = Get.find();
  final _controller = ScrollController();

  final List<GlobalKey> _sectionKeys = List.generate(5, (index) => GlobalKey());
  late TripSpec trip;

  final List<Map<String, dynamic>> sections = [
    {'title': 'Description', 'index': 0},
    {'title': 'Included', 'index': 1},
    {'title': 'Excluded', 'index': 2},
    {'title': 'Itinerary', 'index': 3},
    {'title': 'Terms & Conditions', 'index': 4},
  ];

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      _tripController.updateUserScrolling(true);
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).whenComplete(() {
        _tripController.updateUserScrolling(false);
      });
      _tripController.updateActiveIndex(index);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    trip = widget.tripSpec;
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_tripController.isUserScrolling) return;
    double closestDistance = double.infinity;
    int closestIndex = -1;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero, ancestor: null).dy;

        // Calculate the absolute distance to the top of the screen
        final distanceToTop = position - _controller.offset;

        // Check if this section is the closest one in view
        if (distanceToTop < closestDistance && distanceToTop >= 0) {
          closestDistance = distanceToTop;
          closestIndex = i;
        }
      }
    }

    // Perform your desired action with the closestIndex
    if (closestIndex != -1) {
      _tripController.updateActiveIndex(closestIndex);
    }
  }

  Widget _buildTab(String title, int index, bool isActive) {
    return GestureDetector(
      onTap: () {
        _scrollToSection(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: CustomTextStyle.body3.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 1.0),
            isActive
                ? Container(
                    height: 2,
                    width: 70,
                    color: Colors.blue,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterButtons: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(CurrencyFormat.formatToRupiah(trip.price),
                        style: CustomTextStyle.body3.copyWith(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                    Text(
                      "per pax",
                      style:
                          CustomTextStyle.caption1.copyWith(color: Colors.grey),
                    )
                  ],
                ),
                FilledButton.icon(
                    onPressed: () {},
                    iconAlignment: IconAlignment.end,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12.0,
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    label: Text(
                      "Book Now",
                      style: CustomTextStyle.body3.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        )
      ],
      body: Obx(
        () => CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(
                child: TripDetailHeaderWidget(
              title: trip.name,
              image: trip.image,
            )),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverStickyHeaderDelegate(
                minHeight: 50.0,
                maxHeight: 50.0,
                child: Container(
                  padding: const EdgeInsets.only(top: 24.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: sections.map((section) {
                        return _buildTab(
                            section['title'],
                            section['index'],
                            _tripController.tripDetailActiveIndex ==
                                section['index']);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            TripDetailQuickInfoWidget(
              location: trip.location,
              date: trip.date,
              rating: trip.review,
              totalRating: trip.totalReview,
            ),
            SliverToBoxAdapter(
              child: TripDetailDescriptionWidget(
                text: trip.description,
                key: _sectionKeys[0],
              ),
            ),
            const HorizontalDivider(),
            SliverToBoxAdapter(
              child: TripDetailIncludedWidget(
                items: trip.includedAmenities,
                key: _sectionKeys[1],
              ),
            ),
            const HorizontalDivider(),
            SliverToBoxAdapter(
              child: TripDetailExcludedWidget(
                items: trip.excludedAmenities,
                key: _sectionKeys[2],
              ),
            ),
            const HorizontalDivider(),
            SliverToBoxAdapter(
                child: TripDetailItinerary(
              items: trip.itinerary,
              key: _sectionKeys[3],
            )),
            const HorizontalDivider(),
            SliverToBoxAdapter(
                child: TripDetailTncWidget(
              items: trip.termsCondition,
              key: _sectionKeys[4],
            )),
          ],
        ),
      ),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        color: Colors.grey.shade200,
        thickness: 4,
      ),
    );
  }
}
