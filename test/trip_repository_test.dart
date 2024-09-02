import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:opentripapp/features/trip/data/dto/trip_dto.dart';
import 'package:opentripapp/features/trip/data/repository/trip_repository.dart';
import 'package:opentripapp/features/trip/data/trip_local_data_source.dart';
import 'package:opentripapp/features/trip/domain/entity/trip_spec.dart';
import 'package:opentripapp/features/trip/domain/mapper/trip_mapper.dart';

import 'trip_repository_test.mocks.dart';

// Create mock classes using the mockito package
class MockTripLocalDataSource extends Mock implements TripLocalDataSource {}

class MockTripMapper extends Mock implements TripMapper {}

@GenerateMocks([MockTripLocalDataSource, MockTripMapper])
void main() {
  late DefaultTripRepository repository;
  late MockTripLocalDataSource mockLocalDataSource;
  late MockTripMapper mockMapper;

  setUp(() {
    mockLocalDataSource = MockMockTripLocalDataSource();
    mockMapper = MockMockTripMapper();
    repository = DefaultTripRepository(mockLocalDataSource, mockMapper);
  });

  test('getAllTrips returns a list of TripSpec on success', () async {
    // Arrange
    final List<TripDto> dto = []; // Replace with actual DTOs if necessary
    final List<TripSpec> tripSpecs =
        []; // Replace with actual TripSpec objects if necessary

    // Stub the methods on the mocks
    when(mockLocalDataSource.getAllTrips()).thenAnswer((_) async => dto);
    when(mockMapper.convertDtoToTripSpec(dto)).thenReturn(tripSpecs);

    // Act
    final result = await repository.getAllTrips();

    // Assert
    expect(result, tripSpecs);
    verify(mockLocalDataSource.getAllTrips()).called(1);
    verify(mockMapper.convertDtoToTripSpec(dto)).called(1);
  });

  test('getAllTrips handles failure when local data source fails', () async {
    // Arrange
    when(mockLocalDataSource.getAllTrips())
        .thenThrow(Exception('Failed to get trips'));

    // Act
    final result = repository.getAllTrips();

    // Assert
    await expectLater(await result, []);
    verify(mockLocalDataSource.getAllTrips()).called(1);
    verifyNever(
        mockMapper.convertDtoToTripSpec([])); // Ensure mapper was not called
  });

  test('getAllTrips handles failure when mapping fails', () async {
    // Arrange
    final List<TripDto> dto = [];
    when(mockLocalDataSource.getAllTrips()).thenAnswer((_) async => dto);
    when(mockMapper.convertDtoToTripSpec(dto))
        .thenThrow(Exception('Failed to map trips'));

    // Act
    final result = repository.getAllTrips();

    // Assert
    await expectLater(await result, []);
    verify(mockLocalDataSource.getAllTrips()).called(1);
    verify(mockMapper.convertDtoToTripSpec(dto)).called(1);
  });
}
