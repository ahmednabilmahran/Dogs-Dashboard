// ignore_for_file: public_member_api_docs

part of 'images_list_by_breed_cubit.dart';

///
abstract class ImagesListByBreedState {}

///
class ImagesListByBreedInitial extends ImagesListByBreedState {}

class ImagesListByBreedLoadingState extends ImagesListByBreedState {}

class ImagesListByBreedSuccessState extends ImagesListByBreedState {
  ImagesListByBreedSuccessState(this.images);
  final List<String> images;
}

class ImagesListByBreedErrorState extends ImagesListByBreedState {
  ImagesListByBreedErrorState(this.error);
  final String error;
}
