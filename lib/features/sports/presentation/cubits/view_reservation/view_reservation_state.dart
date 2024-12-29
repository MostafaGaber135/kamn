import 'package:flutter/widgets.dart';

import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';

enum ViewReservationStatus { intial, loading, success, failure }

extension ViewReservationExtension on ViewReservationState {
  bool get inIntial => state == ViewReservationStatus.intial;
  bool get inSuccess => state == ViewReservationStatus.success;
  bool get inLoading => state == ViewReservationStatus.loading;
  bool get inFailure => state == ViewReservationStatus.failure;
}

class ViewReservationState {
  final ViewReservationStatus state;
  final List<ReservationModel>? reservations;
  final String? error;

  ViewReservationState({required this.state, this.reservations, this.error});

  ViewReservationState copyWith({
    ViewReservationStatus? state,
    ValueGetter<List<ReservationModel>?>? reservations,
    ValueGetter<String?>? error,
  }) {
    return ViewReservationState(
      state: state ?? this.state,
      reservations: reservations != null ? reservations() : this.reservations,
      error: error != null ? error() : this.error,
    );
  }
}
