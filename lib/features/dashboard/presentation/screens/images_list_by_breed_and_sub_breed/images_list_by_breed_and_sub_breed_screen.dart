import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/app_values.dart';
import 'package:dogs_dashboard/core/utils/sized_x.dart';
import 'package:dogs_dashboard/core/utils/snack_x.dart';
import 'package:dogs_dashboard/core/widgets/custom_app_bar.dart';
import 'package:dogs_dashboard/core/widgets/custom_padding.dart';
import 'package:dogs_dashboard/core/widgets/easy_auto_complete.dart';
import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_images_list_by_sub_breed.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/controllers/images_list_by_breed_and_sub_breed/images_list_by_breed_and_sub_breed_cubit.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
class ImagesListByBreedAndSubBreedScreen extends StatelessWidget {
  /// Constructor
  const ImagesListByBreedAndSubBreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppValues.dogBreeds.isEmpty
        ? () async {
            await MainCubit.get(context).getAllBreeds();
          }()
        : () {}();

    return BlocProvider(
      create: (context) => ImagesListByBreedAndSubBreedCubit(
        getImagesListBySubBreedUseCase: getIt<GetImagesListBySubBreedUseCase>(),
      ),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (mainContext, mainState) {
          if (mainState is GetAllBreedsLoadingState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            );
          }
          if (mainState is GetAllBreedsErrorState) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await MainCubit.get(context).getAllBreeds();
                  },
                  child: Text(S.of(context).tryAgain),
                ),
              ),
            );
          }
          return BlocConsumer<ImagesListByBreedAndSubBreedCubit,
              ImagesListByBreedAndSubBreedState>(
            listener: (context, state) {
              if (state is ImagesListByBreedAndSubBreedErrorState) {
                SnackX.showSnackBar(message: state.error);
              }
            },
            builder: (context, state) {
              final cubit = ImagesListByBreedAndSubBreedCubit.get(context);
              return Scaffold(
                // Custom App Bar Section
                appBar: customAppBar(
                  context: context,
                  title: S.of(context).imagesListByBreedAndSubBreed,
                  haveBackButton: true,
                ),

                // Main Content Section
                body: CustomPadding(
                  child: Form(
                    key: cubit.imagesListBySubBreedFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: EasyAutocomplete(
                                  suggestions:
                                      AppValues.dogBreeds.keys.toList(),
                                  onChanged: cubit.updateMasterBreed,
                                  controller: cubit.breedController,
                                  inputTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                  hintText: S.of(context).selectBreed,
                                ),
                              ),
                              SizedX.w3,
                              Expanded(
                                child: EasyAutocomplete(
                                  suggestions: cubit.currentSubBreeds,
                                  onChanged: cubit.updateSubBreed,
                                  controller: cubit.subBreedController,
                                  inputTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                  hintText:
                                      (cubit.breedController.text.isNotEmpty &&
                                              cubit.currentSubBreeds.isEmpty)
                                          ? S.of(context).thereIsNoSubBreeds
                                          : S.of(context).selectSubBreed,
                                ),
                              ),
                            ],
                          ),
                          SizedX.h2,
                          ElevatedButton(
                            onPressed: cubit.getImagesListByBreedAndSubBreed,
                            child: Text(S.of(context).generate),
                          ),
                          if ((state
                                  // ignore: lines_longer_than_80_chars
                                  is ImagesListByBreedAndSubBreedSuccessState) &&
                              state.images.isNotEmpty)
                            Column(
                              children: List.generate(
                                state.images.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: state.images[index],
                                    errorWidget: (context, url, error) {
                                      return Center(
                                        child: Text(S.of(context).tryAgain),
                                      );
                                    },
                                  ),
                                ),
                              ).toList(),
                            ),
                          if (state is ImagesListByBreedAndSubBreedLoadingState)
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          if (state is GetAllBreedsErrorState)
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await cubit.getImagesListByBreedAndSubBreed();
                                },
                                child: Text(S.of(context).tryAgain),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
