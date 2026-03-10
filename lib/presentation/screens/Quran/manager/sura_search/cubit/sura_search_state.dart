part of 'sura_search_cubit.dart';

@immutable
sealed class SuraSearchState {}

final class SuraSearchInitial extends SuraSearchState {}

final class SuraSearchLoaded extends SuraSearchState {
  final List<QuranSurahModel> suras;
  SuraSearchLoaded(this.suras);
}
