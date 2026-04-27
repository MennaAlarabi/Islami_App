part of 'reciters_cubit.dart';

@immutable
sealed class RecitersState {}

final class RecitersInitial extends RecitersState {}

final class RecitersLoading extends RecitersState {}

final class RecitersLoaded extends RecitersState {
  final List<ReciterModel> reciters;
  final int currentReciterIndex;
  final int currentSuraIndex;
  final bool isPlaying;
  final bool isFirstSura;
  final bool isLastSura;

  RecitersLoaded({
    required this.reciters,
    required this.currentReciterIndex,
    required this.currentSuraIndex,
    required this.isPlaying,
    required this.isFirstSura,
    required this.isLastSura,
  });
}

final class RecitersFailed extends RecitersState {
  final String error;

  RecitersFailed({required this.error});
}
