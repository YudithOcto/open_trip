import 'package:opentripapp/features/trip/data/trip_local_data_source.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';
import 'package:opentripapp/features/trip/domain/mapper/trip_mapper.dart';
import '../../domain/repository/trip_repository.dart';

class DefaultTripRepository extends TripRepository {
  final TripLocalDataSource _tripLocalDataSource;
  final TripMapper _tripMapper;
  DefaultTripRepository(this._tripLocalDataSource, this._tripMapper);

  @override
  Future<List<TripSpec>> getAllTrips() async {
    try {
      final result = await _tripLocalDataSource.getAllTrips();
      return _tripMapper.convertDtoToTripSpec(result);
    } catch (e) {
      return [];
    }
  }
}
