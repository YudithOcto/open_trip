import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';

abstract class TripRepository {
  Future<List<TripSpec>> getAllTrips();
}