abstract class ImageEvent {}

class ImageLoadRequested extends ImageEvent {
  final String prompt;
  ImageLoadRequested(this.prompt);
}

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final String image;
  ImageLoaded(this.image);
}

class ImageError extends ImageState {}