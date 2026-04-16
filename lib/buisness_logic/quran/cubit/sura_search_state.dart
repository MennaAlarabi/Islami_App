import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';


sealed class SuraSearchState {}

final class SuraSearchInitial extends SuraSearchState {}

final class SuraSearchLoaded extends SuraSearchState {
  final List<QuranSuraModel> suras;
  SuraSearchLoaded(this.suras);
}