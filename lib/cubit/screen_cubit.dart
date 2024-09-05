import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCubit extends Cubit<List<File>?> {
  ScreenCubit() : super(null);
  void setImage(List<File> list) {
    try {
      emit(list);
    } catch (e) {
      emit(null);
    }
  }

  List<File>? getImagesList() => state;
}
