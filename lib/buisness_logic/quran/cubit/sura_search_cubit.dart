import 'package:bloc/bloc.dart';
import 'package:islami/buisness_logic/quran/cubit/sura_search_state.dart';
import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';


class SuraSearchCubit extends Cubit<SuraSearchState> {
  SuraSearchCubit() : super(SuraSearchLoaded(QuranSuraModel.quranSuras));

  void getSearchedSuras(String search) {
    // * searchController
    if (search.isEmpty) {
      // ! no searching
      emit(
        SuraSearchLoaded(QuranSuraModel.quranSuras),
      ); // * all sura list - suras (initlized in SuraSearchLoaded) = quranSuras
    } else {
      // ? searching - suras (initlized in SuraSearchLoaded) = filtering quranSuras
      emit(
        SuraSearchLoaded(
          QuranSuraModel
              .quranSuras // * elements that contains ...?
              .where(
                // * iterable can't return List
                (sura) =>
                    sura.arabicName.contains(search) || // * الفاتحه
                    sura.englishName.toLowerCase().contains(
                      search,
                    ) || // * Fitiha or fatiha
                    sura.verses.toString().contains(search), // * 7
              )
              .toList(),
        ),
      );
    }
  }
}
