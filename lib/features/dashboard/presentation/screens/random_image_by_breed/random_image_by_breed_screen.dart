import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/app_values.dart';
import 'package:dogs_dashboard/core/utils/sized_x.dart';
import 'package:dogs_dashboard/core/utils/snack_x.dart';
import 'package:dogs_dashboard/core/widgets/custom_app_bar.dart';
import 'package:dogs_dashboard/core/widgets/custom_padding.dart';
import 'package:dogs_dashboard/core/widgets/easy_auto_complete.dart';
import 'package:dogs_dashboard/features/dashboard/domain/usecases/get_random_image_by_breed.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/controllers/random_image_by_breed/random_image_by_breed_cubit.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 
class RandomImageByBreedScreen extends StatelessWidget {
  /// Constructor
  const RandomImageByBreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppValues.dogBreeds.isEmpty
        ? () async {
            await MainCubit.get(context).getAllBreeds();
          }()
        : () {}();

    return BlocProvider(
      create: (context) => RandomImageByBreedCubit(
        getRandomImageByBreedUseCase: getIt<GetRandomImageByBreedUseCase>(),
      ),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (mainContext, mainState) {
          if (mainState is GetAllBreedsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (mainState is GetAllBreedsErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () async {
                  await MainCubit.get(context).getAllBreeds();
                },
                child: Text(S.of(context).tryAgain),
              ),
            );
          }
          return BlocConsumer<RandomImageByBreedCubit, RandomImageByBreedState>(
            listener: (context, state) {
              if (state is RandomImageByBreedErrorState) {
                SnackX.showSnackBar(message: state.error);
              }
            },
            builder: (context, state) {
              final cubit = RandomImageByBreedCubit.get(context);

              return Scaffold(
                // Custom App Bar Section
                appBar: customAppBar(
                  context: context,
                  title: S.of(context).randomImageByBreed,
                  haveBackButton: true,
                ),

                // Main Content Section
                body: CustomPadding(
                  child: Form(
                    key: cubit.randomImageByBreedFormKey,
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
                          onPressed: cubit.getRandomImageByBreed,
                          child: Text(S.of(context).generate),
                        ),
                        if ((state is RandomImageByBreedSuccessState) &&
                            state.imageUrl.isNotEmpty)
                          CachedNetworkImage(
                            imageUrl: state.imageUrl,
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Text(S.of(context).tryAgain),
                              );
                            },
                          ),
                        if (state is RandomImageByBreedLoadingState)
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        if (state is GetAllBreedsErrorState)
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                await cubit.getRandomImageByBreed();
                              },
                              child: Text(S.of(context).tryAgain),
                            ),
                          ),
                      ],
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
