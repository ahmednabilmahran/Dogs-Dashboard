import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_images_list_by_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_breed_state.dart';

///
class ImagesListByBreedCubit extends Cubit<ImagesListByBreedState> {
  ///
  ImagesListByBreedCubit({
    required this.getImagesListByBreedUseCase,
  }) : super(ImagesListByBreedInitial());

  /// method to get instance of the cubit
  static ImagesListByBreedCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// Create [imagesListByBreedFormKey] Variable
  GlobalKey<FormState> imagesListByBreedFormKey = GlobalKey();

  /// this variable is used to hold the [breedController]
  TextEditingController breedController = TextEditingController();

  /// Create [getImagesListByBreedUseCase] Variable
  final GetImagesListByBreedUseCase getImagesListByBreedUseCase;

  /// [getImagesListByBreed] Function
  Future<void> getImagesListByBreed() async {
    if (imagesListByBreedFormKey.currentState!.validate()) {
      emit(ImagesListByBreedLoadingState());
      final result = await getImagesListByBreedUseCase.call(
        GetImagesListByBreedParameters(
          breed: breedController.text,
        ),
      );
      result.fold((l) {
        emit(ImagesListByBreedErrorState(l.errMessage));
      }, (r) {
        emit(ImagesListByBreedSuccessState(r));
      });
    }
  }
}
