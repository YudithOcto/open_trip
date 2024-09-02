import 'package:get/get.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';
import 'package:opentripapp/features/trip/domain/repository/trip_repository.dart';

class TripController extends GetxController {
  final TripRepository _tripRepository;

  TripController(this._tripRepository);

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final _trips = RxList<TripSpec>.empty();
  List<TripSpec> get trips => _trips;

  final _tripDetailActiveIndex = RxInt(0);
  int get tripDetailActiveIndex => _tripDetailActiveIndex.value;
  void updateActiveIndex(int newValue) {
    _tripDetailActiveIndex.value = newValue;
  }

  final _isUserScrolling = RxBool(false);
  bool get isUserScrolling => _isUserScrolling.value;
  void updateUserScrolling(bool newValue) => _isUserScrolling.value = newValue;

  @override
  void onInit() {
    super.onInit();
    initTrip();
  }

  Future<void> initTrip() async {
    _isLoading.value = true;
    final result = await _tripRepository.getAllTrips();
    _trips.assignAll(result);
    _isLoading.value = false;
  }
}
