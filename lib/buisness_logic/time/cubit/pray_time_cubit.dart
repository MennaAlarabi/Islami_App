import 'package:bloc/bloc.dart';
import 'package:islami/data/model/time/pray_model.dart';
import 'package:islami/data/repository/time/pray_repo.dart';
import 'package:islami/networking/api_error_handler.dart';
import 'package:meta/meta.dart';

part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit(this.prayRepo) : super(PrayTimeInitial());

  final PrayRepo prayRepo;
  Future<void> getPrayTime() async {
    emit(PrayTimeLoading());
    try {
      final prayer = await prayRepo.getPrayTime();
      emit(PrayTimeLoaded(prayer: prayer));
    } catch (e) {
      emit(PrayTimeFailed(ApiErrorHandler.handle(e)));
    }
  }
}
