part of 'most_recently_cubit.dart';

@immutable
sealed class MostRecentlyState {}

final class MostRecentlyInitial extends MostRecentlyState {}

final class MostRecentlyLoaded extends MostRecentlyState {
  final List<int> tappedSuras;

  MostRecentlyLoaded({required this.tappedSuras});
}
