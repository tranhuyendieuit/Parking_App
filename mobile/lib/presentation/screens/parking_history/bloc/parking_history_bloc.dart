import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/parking_repository.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_event.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_state.dart';

class ParkingHistoryBloc extends Bloc<ParkingHistoryEvent, ParkingHistoryState> {
  ParkingHistoryBloc() : super(ParkingHistoryState.initial()) {
    on<ParkingHistoryInitialEvent>(_onParkingHistoryInitialEvent);
  }

  final ParkingRepository parkingRepository = ParkingRepository();

  void _onParkingHistoryInitialEvent(ParkingHistoryInitialEvent event, Emitter<ParkingHistoryState> emit) async {
    emit(state.copyWith(status: ParkingHistoryStatus.processing));
    final result = await parkingRepository.getParkingHistory();

    result.fold(
      (error) {
        emit(state.copyWith(status: ParkingHistoryStatus.failure));
      },
      (parkingHistories) {
        emit(state.copyWith(
          status: ParkingHistoryStatus.success,
          parkingHistory: parkingHistories,
        ));
      },
    );
  }
}
