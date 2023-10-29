import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_list_by_breed_state.dart';

/// 
class ImagesListByBreedCubit extends Cubit<ImagesListByBreedState> {
  /// 
  ImagesListByBreedCubit() : super(ImagesListByBreedInitial());
}
