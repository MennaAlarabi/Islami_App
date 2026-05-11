import 'package:islami/data/model/time/pray_model.dart';
import 'package:islami/data/web_services/time/pray_web_services.dart';

class PrayRepo {
  final PrayWebServices prayWebServices;
  PrayRepo({required this.prayWebServices});

  Future <PrayModel> getPrayTime() async {
    final prayer = await prayWebServices.getPrayTime();
    return PrayModel.fromJson(prayer['data']);
  }
}
