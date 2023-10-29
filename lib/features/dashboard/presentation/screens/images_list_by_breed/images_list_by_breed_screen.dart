import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/app_values.dart';
import 'package:dogs_dashboard/core/utils/sized_x.dart';
import 'package:dogs_dashboard/core/utils/snack_x.dart';
import 'package:dogs_dashboard/core/widgets/custom_app_bar.dart';
import 'package:dogs_dashboard/core/widgets/custom_padding.dart';
import 'package:dogs_dashboard/core/widgets/easy_auto_complete.dart';
import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_images_list_by_breed.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/controllers/images_list_by_breed/images_list_by_breed_cubit.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
class ImagesListByBreedScreen extends StatelessWidget {
  /// Constructor
  const ImagesListByBreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppValues.dogBreeds.isEmpty
        ? () async {
            await MainCubit.get(context).getAllBreeds();
          }()
        : () {}();

    return BlocProvider(
      create: (context) => ImagesListByBreedCubit(
        getImagesListByBreedUseCase: getIt<GetImagesListByBreedUseCase>(),
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
          return BlocConsumer<ImagesListByBreedCubit, ImagesListByBreedState>(
            listener: (context, state) {
              if (state is ImagesListByBreedErrorState) {
                SnackX.showSnackBar(message: state.error);
              }
            },
            builder: (context, state) {
              final cubit = ImagesListByBreedCubit.get(context);

              return Scaffold(
                // Custom App Bar Section
                appBar: customAppBar(
                  context: context,
                  title: S.of(context).imagesListByBreed,
                  haveBackButton: true,
                ),

                // Main Content Section
                body: CustomPadding(
                  child: Form(
                    key: cubit.imagesListByBreedFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          EasyAutocomplete(
                            suggestions: AppValues.dogBreeds.entries
                                .map((e) => e.key)
                                .toList(),
                            onChanged: (p0) {},
                            controller: cubit.breedController,
                            inputTextStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                            hintText: S.of(context).selectBreed,
                          ),
                          SizedX.h2,
                          ElevatedButton(
                            onPressed: cubit.getImagesListByBreed,
                            child: Text(S.of(context).generate),
                          ),
                          if ((state is ImagesListByBreedSuccessState) &&
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
                          if (state is ImagesListByBreedLoadingState)
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          if (state is GetAllBreedsErrorState)
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await cubit.getImagesListByBreed();
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
