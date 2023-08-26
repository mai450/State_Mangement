import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'convert_ui_state.dart';

class ConvertUiCubit extends Cubit<ConvertUiState> {
  ConvertUiCubit() : super(ConvertUiInitial());

  void showtext() {
    emit(ShowText());
  }

  void showimage() {
    emit(ShowImage());
  }

  void showcircle() {
    emit(ShowCircle());
  }

  void reset() {
    emit(ConvertUiInitial());
  }
}
