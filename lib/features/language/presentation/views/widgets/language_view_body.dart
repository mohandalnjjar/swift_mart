import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/features/home/data/models/category_model.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/language/presentation/views/widgets/language_page_item.dart';
import 'package:swift_mart/features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({
    super.key,
  });

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  late String selectedLanguage;
  late List<CategoryItemModel> items;

  @override
  void initState() {
    selectedLanguage = BlocProvider.of<LanguageCubit>(context).currentLanguage;

    items = [
      const CategoryItemModel(
        title: 'Arabic',
        image: Assets.imagesMg,
        langShort: 'ar',
      ),
      const CategoryItemModel(
        title: 'English',
        image: Assets.imagesFlagOfUnitedKingdomFlatRoundCorner512x512,
        langShort: 'en',
      ),
      const CategoryItemModel(
        title: 'German',
        image: Assets.imagesFlagOfGermanyFlatRoundCorner512x512,
        langShort: 'de',
      ),
      const CategoryItemModel(
        title: 'Spanish',
        image: Assets.imagesFlagOfSpain,
        langShort: 'es',
      ),
      const CategoryItemModel(
        title: 'Indian',
        image: Assets.imagesFlagOfIndiaFlatRoundCorner512x512,
        langShort: 'in',
      ),
      const CategoryItemModel(
        title: 'French',
        image: Assets.imagesFlagOfFrance,
        langShort: 'fr',
      ),
      const CategoryItemModel(
        title: 'Russian',
        image: Assets.imagesFlagOfRussia,
        langShort: 'ru',
      ),
      const CategoryItemModel(
        title: 'Italy',
        image: Assets.imagesFlagOfItaly,
        langShort: 'it',
      ),
      const CategoryItemModel(
        title: 'Portuguese',
        image: Assets.imagesFlagOfPortugalFlatRoundCorner512x512,
        langShort: 'pt',
      ),
      const CategoryItemModel(
        title: 'Urdu',
        image: Assets.imagesFlagOfNorwayFlatRoundCorner512x512,
        langShort: 'ur',
      ),
      const CategoryItemModel(
        title: 'Indonesian',
        image: Assets.imagesFlagOfIndonesiaFlatRoundCorner512x512,
        langShort: 'id',
      ),
      const CategoryItemModel(
        title: 'Japanese',
        image: Assets.imagesFlagOfJapanFlatRoundCorner512x512,
        langShort: 'ja',
      ),
      const CategoryItemModel(
        title: 'Vietnamese',
        image: Assets.imagesFlagOfVietnamFlatRoundCorner512x512,
        langShort: 'vi',
      ),
    ];
    var selectedIndex =
        items.indexWhere((item) => item.langShort == selectedLanguage);
    var removedIndex = items.removeAt(selectedIndex);
    items.insert(0, removedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageState>(
      listener: (context, state) {
        if (state is LanguageLoading) {
          const CustomLoadingIndicator(inAsyncCall: true);
        } else if (state is LanguageChangeDone) {
          context.pop();
          showedScaffoldMessage(
              context: context,
              message: S.of(context).LanguageChangedSuccessfully);
        } else {
          showedScaffoldMessage(
            context: context,
            message: S.of(context).SomeThingWentWongTyrAgain,
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            //Search Appbar
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              sliver: SliverAppBar(
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                centerTitle: true,
                title: Text(
                  S.of(context).Language,
                  style: AppStyles.styleSemiBold30(context),
                ),
                actions: [
                  CustomButton(
                    icon: const Icon(
                      Ionicons.checkmark,
                      color: Colors.white,
                    ),
                    onTap: () {
                      if (BlocProvider.of<LanguageCubit>(context)
                              .currentLanguage ==
                          selectedLanguage) {
                        showedScaffoldMessage(
                          context: context,
                          message: S.of(context).LanguageAlreadyUsed,
                        );
                      } else {
                        BlocProvider.of<LanguageCubit>(context)
                            .changeAppLanguage(
                          langValue: selectedLanguage,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            SliverGrid.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2.1,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (selectedLanguage != items[index].langShort) {
                    setState(
                      () {
                        selectedLanguage = items[index].langShort;
                        var selected = items.removeAt(index);
                        items.insert(0, selected);
                      },
                    );
                  }
                },
                child: LanguagePageItem(
                  categoryItmeModel: items[index],
                  isActive: selectedLanguage == items[index].langShort,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
