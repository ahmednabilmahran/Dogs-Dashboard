part of 'random_image_by_breed_cubit.dart';

abstract class RandomImageByBreedState {}

class RandomImageByBreedInitial extends RandomImageByBreedState {}

class RandomImageByBreedLoadingState extends RandomImageByBreedState {}

class RandomImageByBreedSuccessState extends RandomImageByBreedState {
  RandomImageByBreedSuccessState(this.imageUrl);
  final String imageUrl;
}

class RandomImageByBreedErrorState extends RandomImageByBreedState {
  RandomImageByBreedErrorState(this.error);
  final String error;
}
