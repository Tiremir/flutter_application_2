import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/blocs/events_and_states.dart';

Future<String> generateImage(String prompt) async {
  await Future.delayed(Duration(seconds: Random().nextInt(2) + 2));
  if (Random().nextBool()) throw Exception("API Error");
  return 'assets/placeholder.png';
}

class ImageGeneratorBloc extends Bloc<ImageEvent, ImageState> {
  ImageGeneratorBloc() : super(ImageInitial()) {
    on<ImageLoadRequested>(generate);
  }

  Future<void> generate(ImageLoadRequested event, Emitter<ImageState> emit) async {
    try {
      emit(ImageLoading());
      final image = await generateImage(event.prompt);
      emit(ImageLoaded(image));
    } catch (e) {
      emit(ImageError());
    }
  }
}