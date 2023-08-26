import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());

  int currentradio = 0;
  void button() {
    emit(RadioInitial());
  }
}
