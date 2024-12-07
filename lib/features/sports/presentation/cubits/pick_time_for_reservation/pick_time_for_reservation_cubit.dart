import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_view_model.dart';

@injectable
class PickTimeForReservationCubit extends Cubit<PickTimeForReservationState> {
  PickTimeForReservationCubit(
      {required this.repository, required this.viewModel})
      : super(PickTimeForReservationState(
            state: PickTimeForReservationStatus.initial)) {
    getAllReservation();
  }
  SportsRepository repository;
  PickTimeForReservationViewModel viewModel;

  void onIntervalSelection(DateTime interval, String day) {
    if (viewModel.selectedIntervals.containsKey(day)) {
      if (viewModel.selectedIntervals[day]!.contains(interval)) {
        viewModel.selectedIntervals[day]!.remove(interval);
      } else {
        viewModel.selectedIntervals[day]!.add(interval);
      }
    } else {
      viewModel.selectedIntervals[day] = [];
      viewModel.selectedIntervals[day]!.add(interval);
    }
    emit(state.copyWith(state: PickTimeForReservationStatus.intervalSelected));
  }

  Future<void> onSubmitReservation(ReservationModel reservation) async {
    emit(state.copyWith(state: PickTimeForReservationStatus.loading));
    var response = await repository.submitReservation(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.success, reservation: success));
    });
  }

  Future<void> deleteReservation(ReservationModel reservation) async {
    var response = await repository.delete(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationDeleted));
    });
  }

  void onDaySelected(DateTime newDay) {
    emit(state.copyWith(
        state: PickTimeForReservationStatus.loading, selectedDate: newDay));
  }

  Future<void> getAllReservation() async {
    var response = await repository.getAllReservation();
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationLoaded,
          reservationList: success));
    });
  }
}
