import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/parking_repository.dart';

import 'parking_list_event.dart';
import 'parking_list_state.dart';

class ParkingListBloc extends Bloc<ParkingListEvent, ParkingListState> {
  ParkingListBloc() : super(ParkingListState.initial()) {
    on<ParkingListInitialEvent>(_onParkingListInitialEvent);
  }

  final ParkingRepository parkingRepository = ParkingRepository();

  void _onParkingListInitialEvent(ParkingListInitialEvent event, Emitter<ParkingListState> emit) async {
    emit(state.copyWith(
      status: ParkingListStatus.processing,
      parkingList: [],
    ));
    final result = await parkingRepository.getParkingList();

    result.fold(
      (error) {
        emit(state.copyWith(status: ParkingListStatus.failure));
      },
      (parkingList) {
        emit(state.copyWith(
          status: ParkingListStatus.success,
          parkingList: parkingList,
        ));
      },
    );
  }
}
