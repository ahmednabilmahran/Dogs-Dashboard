import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_image_by_breed_and_sub_breed_state.dart';

class RandomImageByBreedAndSubBreedCubit
    extends Cubit<RandomImageByBreedAndSubBreedState> {
  RandomImageByBreedAndSubBreedCubit()
      : super(RandomImageByBreedAndSubBreedInitial());
}
