import 'package:get/get.dart';
import 'package:opentripapp/features/trip/data/repository/trip_repository.dart';
import 'package:opentripapp/features/trip/data/trip_local_data_source.dart';
import 'package:opentripapp/features/trip/domain/mapper/trip_mapper.dart';
import 'package:opentripapp/features/trip/domain/repository/trip_repository.dart';
import 'package:uuid/uuid.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Uuid>(() => const Uuid());
    Get.lazyPut<TripLocalDataSource>(
        () => DefaultTripLocalDataSource(Get.find()));
    Get.lazyPut<TripMapper>(() => DefaultTripMapper());
    Get.lazyPut<TripRepository>(
        () => DefaultTripRepository(Get.find(), Get.find()));
  }
}
