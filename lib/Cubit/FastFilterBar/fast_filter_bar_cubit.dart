import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'fast_filter_bar_state.dart';

class FastFilterBarCubit extends Cubit<FastFilterBarState> {
  FastFilterBarCubit() : super(FastFilterBarInitial());

  int TappedButtonIndex = 0;
  void changeButtonColor(int index) {
    TappedButtonIndex = index;

    emit(FastFilterBarInitial());
  }
}
