import 'package:islami/data/model/radio/reciters_model.dart';
import 'package:islami/data/web_services/radio/reciters_web_services.dart';

class RecitersRepo {
  final RecitersWebServices recitersWebServices;
  RecitersRepo({required this.recitersWebServices});

  Future<List<ReciterModel>> getRecitersAudios() async {
    final response = await recitersWebServices.getRecitersAudios();
    return (response['reciters'] as List)
        .map((reciter) => ReciterModel.fromJson(reciter))
        .toList();
  }
}
