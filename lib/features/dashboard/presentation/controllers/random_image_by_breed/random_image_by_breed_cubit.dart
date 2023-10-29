import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_random_image_by_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_breed_state.dart';

/// RandomImageByBreedCubit
class RandomImageByBreedCubit extends Cubit<RandomImageByBreedState> {
  /// Constructor
  RandomImageByBreedCubit({
    required this.getRandomImageByBreedUseCase,
  }) : super(RandomImageByBreedInitial());

  /// method to get instance of the cubit
  static RandomImageByBreedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// Create [randomImageByBreedFormKey] Variable
  GlobalKey<FormState> randomImageByBreedFormKey = GlobalKey();

  /// this variable is used to hold the [breedController]
  TextEditingController breedController = TextEditingController();

  /// Create [getRandomImageByBreedUseCase] Variable
  final GetRandomImageByBreedUseCase getRandomImageByBreedUseCase;

  /// [getRandomImageByBreed] Function
  Future<void> getRandomImageByBreed() async {
    if (randomImageByBreedFormKey.currentState!.validate()) {
      emit(RandomImageByBreedLoadingState());
      final result = await getRandomImageByBreedUseCase.call(
        GetRandomImageByBreedParameters(
          breed: breedController.text,
        ),
      );
      result.fold((l) {
        emit(RandomImageByBreedErrorState(l.errMessage));
      }, (r) {
        emit(RandomImageByBreedSuccessState(r));
      });
    }
  }
}
