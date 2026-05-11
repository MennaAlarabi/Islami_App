part of 'pray_time_cubit.dart';

@immutable
sealed class PrayTimeState {}

final class PrayTimeInitial extends PrayTimeState {}

final class PrayTimeLoading extends PrayTimeState {}

final class PrayTimeLoaded extends PrayTimeState {
  final PrayModel prayer;

  PrayTimeLoaded({required this.prayer});
}

final class PrayTimeFailed extends PrayTimeState {
  final String error;

  PrayTimeFailed(this.error);
}
