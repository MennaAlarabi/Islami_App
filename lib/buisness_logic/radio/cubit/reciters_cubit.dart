import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reciters_state.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit() : super(RecitersInitial());
}
