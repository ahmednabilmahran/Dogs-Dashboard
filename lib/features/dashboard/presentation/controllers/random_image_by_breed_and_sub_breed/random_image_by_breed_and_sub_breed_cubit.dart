import 'package:dogs_dashboard/core/utils/app_values.dart';
import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_random_image_by_sub_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_breed_and_sub_breed_state.dart';

/// [RandomImageByBreedAndSubBreedCubit]
/// is responsible for managing the state related
/// to displaying random images of dog breeds and sub-breeds.
class RandomImageByBreedAndSubBreedCubit
    extends Cubit<RandomImageByBreedAndSubBreedState> {
  /// Constructs an instance of [RandomImageByBreedAndSubBreedCubit].
  ///
  /// Takes a [GetRandomImageBySubBreedUseCase] as a required parameter.
  RandomImageByBreedAndSubBreedCubit({
    required this.getRandomImageBySubBreedUseCase,
  }) : super(RandomImageByBreedAndSubBreedInitial());

  /// Helper function to get the [RandomImageByBreedAndSubBreedCubit] from the
  /// Flutter BuildContext.
  static RandomImageByBreedAndSubBreedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// Global key used to manage the form state.
  GlobalKey<FormState> randomImageBySubBreedFormKey = GlobalKey();

  /// Controller for the breed text input.
  TextEditingController breedController = TextEditingController();

  /// Controller for the sub-breed text input.
  TextEditingController subBreedController = TextEditingController();

  /// List to hold the current sub-breeds based on selected master breed.
  List<String> currentSubBreeds = [];

  /// Updates the master breed and corresponding sub-breeds.
  ///
  ///
  void updateMasterBreed(String masterBreed) {
    currentSubBreeds = AppValues.dogBreeds[masterBreed]!;
    subBreedController.clear(); // Clear the sub-breed if master breed changes
    emit(UpdateListState());
  }

  /// Updates the updateSubBreed
  ///
  ///
  void updateSubBreed(String subBreed) {
    emit(UpdateSubListState());
  }

  /// Create [getRandomImageBySubBreedUseCase] Variable
  final GetRandomImageBySubBreedUseCase getRandomImageBySubBreedUseCase;

  /// [getRandomImageByBreedAndSubBreed] Function
  Future<void> getRandomImageByBreedAndSubBreed() async {
    if (randomImageBySubBreedFormKey.currentState!.validate()) {
      emit(RandomImageByBreedAndSubBreedLoadingState());
      final result = await getRandomImageBySubBreedUseCase.call(
        GetRandomImageBySubBreedParameters(
          breed: breedController.text,
          subBreed: subBreedController.text,
        ),
      );
      result.fold((l) {
        emit(RandomImageByBreedAndSubBreedErrorState(l.errMessage));
      }, (r) {
        emit(RandomImageByBreedAndSubBreedSuccessState(r));
      });
    }
  }
}
