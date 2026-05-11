import 'package:bloc/bloc.dart';
import 'package:islami/buisness_logic/quran/cubit/sura_search_state.dart';
import 'package:islami/presentation/screens/quran/model/quran_sura_model.dart';


class SuraSearchCubit extends Cubit<SuraSearchState> {
  SuraSearchCubit() : super(SuraSearchLoaded(QuranSuraModel.quranSuras));

  void getSearchedSuras(String search) {
    if (search.isEmpty) {
      emit(
        SuraSearchLoaded(QuranSuraModel.quranSuras),
      );
    } else {
      emit(
        SuraSearchLoaded(
          QuranSuraModel
              .quranSuras
              .where(
                (sura) =>
                    sura.arabicName.contains(search) ||
                    sura.englishName.toLowerCase().contains(
                      search,
                    ) ||
                    sura.verses.toString().contains(search), 
              )
              .toList(),
        ),
      );
    }
  }
}
