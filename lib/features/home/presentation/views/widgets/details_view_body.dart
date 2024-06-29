import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/detailes_list_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_view_nums_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      Assets.imagesAppIcon,
      Assets.imagesApple,
      Assets.imagesLaptop,
      Assets.imagesShose,
    ];

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              items[activeIndex],
              fit: BoxFit.contain,
            ),
          ),
          backgroundColor: AppColors.kWhiteGrey,
          expandedHeight: MediaQuery.sizeOf(context).height * .40,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: BlocBuilder<ThemeCubit, ThemeCubitState>(
              builder: (context, state) {
                return Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: BlocProvider.of<ThemeCubit>(context).themeMode
                        ? AppColors.kDarkScaffoldColor
                        : AppColors.kLightScaffoldColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () => context.pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_border,
              ),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Nike air jordan xxxv',
                  style: AppStyles.styleRegular24(context),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Nike Men\'s shose',
                  style: AppStyles.styleGreyReg16(context),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    const RatingWidget(),
                    const Spacer(),
                    Text(
                      r'$230,12',
                      style: AppStyles.styleBold27(context),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //Images list
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (activeIndex != index) {
                            setState(() {
                              activeIndex = index;
                            });
                          }
                        },
                        child: DetailedListItem(
                          isActive: activeIndex == index,
                          image: items[index],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Size Guide',
                  style: AppStyles.styleSemiBold24(context),
                ),
                const SizedBox(height: 15),
                //DetailsViewNumsList
                const SizedBox(
                  height: 67,
                  child: DetailsViewNumsList(),
                ),
                //Details Sections
                ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  shape: Border.all(color: Colors.transparent),
                  title: Text(
                    'Description',
                    style: AppStyles.styleSemiBold24(context),
                  ),
                  children: [
                    Text(
                      'Hello thsi is me muhanned alnjjar a flutter developer with greatmind in conding Hello thsi is me muhanned alnjjar a flutter developer with greatmind in conding Hello thsi is me muhanned alnjjar a flutter developer with greatmind in conding Hello thsi is me muhanned alnjjar a flutter developer with greatmind in conding Hello thsi is me muhanned alnjjar a flutter developer with greatmind in conding',
                      style: AppStyles.styleRegular17(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
