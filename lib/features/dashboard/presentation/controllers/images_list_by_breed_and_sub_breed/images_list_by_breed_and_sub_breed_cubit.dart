import 'package:dogs_dashboard/core/utils/app_values.dart';
import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_images_list_by_sub_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_breed_and_sub_breed_state.dart';

///
class ImagesListByBreedAndSubBreedCubit
    extends Cubit<ImagesListByBreedAndSubBreedState> {
  ///
  ImagesListByBreedAndSubBreedCubit({
    required this.getImagesListBySubBreedUseCase,
  }) : super(ImagesListByBreedAndSubBreedInitial());

  /// Helper function to get the [ImagesListByBreedAndSubBreedCubit] from the
  /// Flutter BuildContext.
  static ImagesListByBreedAndSubBreedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// Global key used to manage the form state.
  GlobalKey<FormState> imagesListBySubBreedFormKey = GlobalKey();

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

  /// Create [getImagesListBySubBreedUseCase] Variable
  final GetImagesListBySubBreedUseCase getImagesListBySubBreedUseCase;

  /// [getImagesListByBreedAndSubBreed] Function
  Future<void> getImagesListByBreedAndSubBreed() async {
    if (imagesListBySubBreedFormKey.currentState!.validate()) {
      emit(ImagesListByBreedAndSubBreedLoadingState());
      final result = await getImagesListBySubBreedUseCase.call(
        GetImagesListBySubBreedParameters(
          breed: breedController.text,
          subBreed: subBreedController.text,
        ),
      );
      result.fold((l) {
        emit(ImagesListByBreedAndSubBreedErrorState(l.errMessage));
      }, (r) {
        emit(ImagesListByBreedAndSubBreedSuccessState(r));
      });
    }
  }
}
