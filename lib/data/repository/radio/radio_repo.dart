import 'package:islami/data/model/radio/radio_model.dart';
import 'package:islami/data/web_services/radio/radio_web_services.dart';

class RadioRepo {
  final RadioWebServices radioWebServices;
  RadioRepo({required this.radioWebServices});

  Future<List<RadioModel>> getRadioAudios() async {
    final response = await radioWebServices.getRadioAudios();
    return (response['radios'] as List)
        .map((radio) => RadioModel.fromJson(radio))
        .toList();
  }
}