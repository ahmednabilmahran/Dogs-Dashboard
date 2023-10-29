import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_breed_and_sub_breed_state.dart';

class ImagesListByBreedAndSubBreedCubit
    extends Cubit<ImagesListByBreedAndSubBreedState> {
  ImagesListByBreedAndSubBreedCubit()
      : super(ImagesListByBreedAndSubBreedInitial());
}
