import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/parking_repository.dart';

import 'parking_detail_event.dart';
import 'parking_detail_state.dart';

class ParkingDetailBloc extends Bloc<ParkingDetailEvent, ParkingDetailState> {
  final ParkingRepository parkingRepository = ParkingRepository();

  ParkingDetailBloc() : super(ParkingDetailState.initial()) {
    on<ParkingDetailInitialEvent>(_onParkingDetailInitialEvent);
  }

  void _onParkingDetailInitialEvent(ParkingDetailInitialEvent event, Emitter<ParkingDetailState> emit) async {
    if ((event.parkingDetail?.id ?? '').isEmpty) return;

    emit(state.copyWith(status: ParkingDetailStatus.processing));
    final result = await parkingRepository.getParkingDetail(event.parkingDetail?.id ?? '');

    result.fold(
      (error) => emit(state.copyWith(status: ParkingDetailStatus.failure)),
      (parkingDetail) {
        final parkingFullDetail = event.parkingDetail?.copyWith(
          id: parkingDetail.id,
          capacity: parkingDetail.capacity,
          occupation: parkingDetail.occupation,
        );

        emit(state.copyWith(
          status: ParkingDetailStatus.success,
          parkingDetail: parkingFullDetail,
        ));
      },
    );

    emit(state.copyWith(status: ParkingDetailStatus.initial));
  }
}
