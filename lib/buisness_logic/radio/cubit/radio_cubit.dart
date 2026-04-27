import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:islami/data/model/radio/radio_model.dart';
import 'package:islami/data/repository/radio/radio_repo.dart';
import 'package:islami/networking/api_error_handler.dart';
import 'package:meta/meta.dart';
part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioRepo radioRepo; //* catch the list of radio's audios
  final AudioPlayer audioPlayer = AudioPlayer();
  String? _pendingUrl;

  RadioCubit(this.radioRepo) : super(RadioInitial());

  Future<void> getRadios() async { //! recieved the data
    emit(RadioLoadingState());

    try {
      final radios = await radioRepo.getRadioAudios();
      emit(
        RadioLoadedState(
          radios: radios,
          isLoading: false,
          currentUrl: null,
          isMuted: false,
        ),
      );
    } catch (e) {
      emit(RadioFailedState(ApiErrorHandler.handle(e)));
    }
  }

  Future<void> toggleRadio(String url) async { //! play radio
    final currentState = state as RadioLoadedState;
  //* stop radio
    if (currentState.currentUrl == url) { //* if the radio is playing stop it
      await audioPlayer.stop();
      _pendingUrl = null;

      emit(
        RadioLoadedState(
          radios: currentState.radios,
          isLoading: false,
          currentUrl: null,
          isMuted: currentState.isMuted,
        ),
      );
      return;
    }
  //* play a radio
    _pendingUrl = url;
    emit(
      RadioLoadedState(
        radios: currentState.radios,
        isLoading: true,
        currentUrl: url,
        isMuted: currentState.isMuted,
      ),
    );

    try {
      await audioPlayer.stop();
      await Future.delayed(Duration(milliseconds: 300));

      if (_pendingUrl != url) return;
      await audioPlayer.play(UrlSource(url)); //* playing

      if (_pendingUrl != url) return;

      emit(
        RadioLoadedState(
          radios: currentState.radios,
          isLoading: false,
          currentUrl: url,
          isMuted: currentState.isMuted,
        ),
      );
    } catch (e) {
      try {
        await Future.delayed(Duration(seconds: 1));
        if (_pendingUrl != url) return;

        await audioPlayer.play(UrlSource(url));

        emit(
          RadioLoadedState(
            radios: currentState.radios,
            isLoading: false,
            currentUrl: url,
            isMuted: currentState.isMuted,
          ),
        );
      } catch (e) {
        if (_pendingUrl == url) {
          _pendingUrl = null;

          emit(
            RadioLoadedState(
              radios: currentState.radios,
              isLoading: false,
              currentUrl: null,
              isMuted: false,
            ),
          );
        }
      }
    }
  }

  Future<void> toggleMute() async {
    final currentState = state as RadioLoadedState;
    if (currentState.isMuted) {
      await audioPlayer.setVolume(1.0);
    } else {
      await audioPlayer.setVolume(0.0);
    }
    emit(
      RadioLoadedState(
        radios: currentState.radios,
        isLoading: currentState.isLoading,
        currentUrl: currentState.currentUrl,
        isMuted: !currentState.isMuted,
      ),
    );
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
