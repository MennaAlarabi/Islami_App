import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islami/data/model/radio/reciters_model.dart';
import 'package:islami/data/repository/radio/reciters_repo.dart';
import 'package:islami/networking/api_error_handler.dart';
import 'package:meta/meta.dart';

part 'reciters_state.dart';

class RecitersCubit extends Cubit<RecitersState> {
  final RecitersRepo recitersRepo;
  final AudioPlayer audioPlayer = AudioPlayer();
  RecitersCubit(this.recitersRepo) : super(RecitersInitial());

  Future<void> getReciters() async {
    emit(RecitersLoading());

    try {
      final response = await recitersRepo.getRecitersAudios();
      emit(
        RecitersLoaded(
          reciters: response,
          currentReciterIndex: 0,
          currentSuraIndex: 0,
          isPlaying: false,
          isFirstSura: true,
          isLastSura: false,
        ),
      );
    } on Exception catch (e) {
      emit(RecitersFailed(error: ApiErrorHandler.handle(e)));
    }
  }

  String buildUrl(ReciterModel reciter, int surahNumber) {
    return "${reciter.moshaf.first.server}${surahNumber.toString().padLeft(3, '0')}.mp3";
  }

  List<int> getSurahList(ReciterModel reciter) {
    return reciter.moshaf.first.surahList
            ?.split(',')
            .map((e) => int.parse(e.trim()))
            .toList() ??
        [];
  }

  Future<void> toggleReciter(int reciterIndex) async {
    final currentState = state as RecitersLoaded;
    if (currentState.isPlaying &&
        currentState.currentReciterIndex == reciterIndex) {
      await audioPlayer.stop();
      emit(
        RecitersLoaded(
          reciters: currentState.reciters,
          currentReciterIndex: currentState.currentReciterIndex,
          currentSuraIndex: currentState.currentSuraIndex,
          isPlaying: false,
          isFirstSura: currentState.isFirstSura,
          isLastSura: currentState.isLastSura,
        ),
      );
    } else {
      await audioPlayer.stop();
      final reciter = currentState.reciters[reciterIndex];
      final suraList = getSurahList(reciter);
      final url = buildUrl(reciter, suraList[0]);

      await audioPlayer.play(UrlSource(url));
      emit(
        RecitersLoaded(
          reciters: currentState.reciters,
          currentReciterIndex: reciterIndex,
          currentSuraIndex: currentState.currentSuraIndex,
          isPlaying: true,
          isFirstSura: currentState.isFirstSura,
          isLastSura: currentState.isLastSura,
        ),
      );
    }
  }

  Future<void> nextSura() async {
    final currentState = state as RecitersLoaded;
    final reciter = currentState.reciters[currentState.currentReciterIndex];
    final suraList = getSurahList(reciter);

    if (currentState.currentSuraIndex >= suraList.length - 1) return;

    final newIndex = currentState.currentSuraIndex + 1;
    final url = buildUrl(reciter, suraList[newIndex]);

    await audioPlayer.play(UrlSource(url));
    emit(
      RecitersLoaded(
        reciters: currentState.reciters,
        currentReciterIndex: currentState.currentReciterIndex,
        currentSuraIndex: newIndex,
        isPlaying: true,
        isFirstSura: newIndex == 0,
        isLastSura: newIndex == suraList.length - 1,
      ),
    );
  }

  Future<void> previousSura() async {
    final currentState = state as RecitersLoaded;
    final reciter = currentState.reciters[currentState.currentReciterIndex];
    final suraList = getSurahList(reciter);

    if (currentState.currentSuraIndex <= 0) return;

    final newIndex = currentState.currentSuraIndex - 1;
    final url = buildUrl(reciter, suraList[newIndex]);

    await audioPlayer.play(UrlSource(url));
    emit(
      RecitersLoaded(
        reciters: currentState.reciters,
        currentReciterIndex: currentState.currentReciterIndex,
        currentSuraIndex: newIndex,
        isPlaying: true,
        isFirstSura: newIndex == 0,
        isLastSura: newIndex == suraList.length - 1,
      ),
    );
  }
}
