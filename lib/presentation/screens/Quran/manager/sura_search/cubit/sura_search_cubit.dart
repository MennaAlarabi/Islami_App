import 'package:bloc/bloc.dart';
import 'package:islami/presentation/screens/Quran/model/quran_sura_model.dart';
import 'package:meta/meta.dart';

part 'sura_search_state.dart';

class SuraSearchCubit extends Cubit<SuraSearchState> {
  SuraSearchCubit() : super(SuraSearchLoaded(QuranSurahModel.quranSurahs));

  void getSearchedSuras(String search) {
    if (search.isEmpty) {
      emit(SuraSearchLoaded(QuranSurahModel.quranSurahs));
    } else {
      emit(
        SuraSearchLoaded(
          QuranSurahModel.quranSurahs
              .where(
                (sura) =>
                    sura.arabicName.contains(search) ||
                    sura.englishName.toLowerCase().contains(search) ||
                    sura.verses.toString().contains(search),
              )
              .toList(),
        ),
      );
    }
  }
}
