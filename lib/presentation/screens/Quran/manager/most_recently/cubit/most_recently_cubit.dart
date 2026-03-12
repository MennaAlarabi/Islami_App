import 'package:bloc/bloc.dart';
import 'package:islami/presentation/screens/Quran/widgets/suras_list.dart';
import 'package:meta/meta.dart';

part 'most_recently_state.dart';

class MostRecentlyCubit extends Cubit<MostRecentlyState> {
  MostRecentlyCubit() : super(MostRecentlyInitial());

  void getAllSuras() {
    final newList = List<int>.from(
      SurasList.tappedSura,
    ); // * Copy of tappedSuar List
    emit(MostRecentlyLoaded(tappedSuras: newList));
  }
}
