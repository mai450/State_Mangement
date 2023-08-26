part of 'convert_ui_cubit.dart';

@immutable
sealed class ConvertUiState {}

final class ConvertUiInitial extends ConvertUiState {}

final class ShowText extends ConvertUiState {}

final class ShowImage extends ConvertUiState {}

final class ShowCircle extends ConvertUiState {}
