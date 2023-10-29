// ignore_for_file: public_member_api_docs

part of 'random_image_by_breed_and_sub_breed_cubit.dart';

abstract class RandomImageByBreedAndSubBreedState {}

class RandomImageByBreedAndSubBreedInitial
    extends RandomImageByBreedAndSubBreedState {}

class RandomImageByBreedAndSubBreedLoadingState
    extends RandomImageByBreedAndSubBreedState {}

class RandomImageByBreedAndSubBreedSuccessState
    extends RandomImageByBreedAndSubBreedState {
  RandomImageByBreedAndSubBreedSuccessState(this.imageUrl);
  final String imageUrl;
}

class RandomImageByBreedAndSubBreedErrorState
    extends RandomImageByBreedAndSubBreedState {
  RandomImageByBreedAndSubBreedErrorState(this.error);
  final String error;
}

class UpdateListState extends RandomImageByBreedAndSubBreedState {}

class UpdateSubListState extends RandomImageByBreedAndSubBreedState {}
