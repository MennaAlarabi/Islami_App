import 'package:islami/data/model/radio/radio_model.dart';
import 'package:islami/data/web_services/radio/radio_web_services.dart';

class RadioRepo { //* bridge between data layer and BLoC layer
  final RadioWebServices radioWebServices; //* catch the api's data
  RadioRepo({required this.radioWebServices});

  Future<List<RadioModel>> getRadioAudios() async {
    final response = await radioWebServices.getRadioAudios(); //* list of radio audios
    return (response['radios'] as List)
        .map((radio) => RadioModel.fromJson(radio))
        .toList();
  }
}