class TripSpec {
  final String id;
  final String name;
  final String location;
  final String image;
  final int totalReview;
  final double review;
  final String date;
  final String description;
  final List<String> includedAmenities;
  final List<String> excludedAmenities;
  final Map<String, String> itinerary;
  final double price;
  final double priceBeforeDiscount;
  final List<String> termsCondition;

  TripSpec({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.totalReview,
    required this.review,
    required this.date,
    required this.description,
    required this.includedAmenities,
    required this.excludedAmenities,
    required this.itinerary,
    required this.price,
    required this.termsCondition,
    this.priceBeforeDiscount = 0.0,
  });
}
