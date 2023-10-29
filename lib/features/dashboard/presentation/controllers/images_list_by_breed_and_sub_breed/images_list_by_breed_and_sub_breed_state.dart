// ignore_for_file: public_member_api_docs

part of 'images_list_by_breed_and_sub_breed_cubit.dart';

///
abstract class ImagesListByBreedAndSubBreedState {}

///
class ImagesListByBreedAndSubBreedInitial
    extends ImagesListByBreedAndSubBreedState {}

class ImagesListByBreedAndSubBreedLoadingState
    extends ImagesListByBreedAndSubBreedState {}

class ImagesListByBreedAndSubBreedSuccessState
    extends ImagesListByBreedAndSubBreedState {
  ImagesListByBreedAndSubBreedSuccessState(this.images);
  final List<String> images;
}

class ImagesListByBreedAndSubBreedErrorState
    extends ImagesListByBreedAndSubBreedState {
  ImagesListByBreedAndSubBreedErrorState(this.error);
  final String error;
}

class UpdateListState extends ImagesListByBreedAndSubBreedState {}

class UpdateSubListState extends ImagesListByBreedAndSubBreedState {}
