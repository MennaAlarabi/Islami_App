part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitial extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioLoadedState extends RadioState {
  final List<RadioModel> radios;
  final bool isLoading;
  final String? currentUrl;
  final bool isMuted;

  RadioLoadedState({
    required this.radios,
    required this.isLoading,
    required this.currentUrl,
    required this.isMuted,
  });
}

class RadioFailedState extends RadioState {
  final String error;

  RadioFailedState(this.error);
}
