import 'package:opentripapp/features/trip/data/dto/trip_dto.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';

abstract class TripMapper {
  List<TripSpec> convertDtoToTripSpec(List<TripDto> trips);
}

class DefaultTripMapper extends TripMapper {
  @override
  List<TripSpec> convertDtoToTripSpec(List<TripDto> trips) {
    return trips
        .map((dto) => TripSpec(
              id: dto.id,
              name: dto.name,
              location: dto.location,
              image: dto.image,
              totalReview: dto.totalReview,
              review: dto.review,
              date: dto.date,
              description: dto.description,
              includedAmenities: dto.includedAmenities,
              excludedAmenities: dto.excludedAmenities,
              itinerary: dto.itinerary,
              price: dto.price,
              termsCondition: dto.termsCondition,
              priceBeforeDiscount: dto.priceBeforeDiscount,
            ))
        .toList();
  }
}
