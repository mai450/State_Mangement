import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  bool isshow = false;

  void PasswordVisibility() {
    isshow = !isshow;
    emit(PasswordInitial());
  }
}
