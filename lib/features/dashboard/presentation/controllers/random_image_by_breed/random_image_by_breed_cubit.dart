import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_random_image_by_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_breed_state.dart';

class RandomImageByBreedCubit extends Cubit<RandomImageByBreedState> {
  RandomImageByBreedCubit({
    required this.getRandomImageByBreedUseCase,
  }) : super(RandomImageByBreedInitial());

  static RandomImageByBreedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// Create [randomImageByBreedFormKey] Variable
  GlobalKey<FormState> randomImageByBreedFormKey = GlobalKey();

  /// this variable is used to hold the [breedController]
  TextEditingController breedController = TextEditingController();

  /// Create [getRandomImageByBreedUseCase] Variable
  final GetRandomImageByBreedUseCase getRandomImageByBreedUseCase;

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
