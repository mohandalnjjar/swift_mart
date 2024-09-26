import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/add_remove_cart_buttom.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/add_remove_to_favoriets_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/detailes_list_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_view_nums_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  int activeIndex = 0;
  String? selectedSize;
  int? selectedQuantity;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items = widget.productModel.images;

    return MultiBlocListener(
      listeners: [
        BlocListener<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              showedScaffoldMessage(context: context, message: 'Added to cart');
            } else if (state is AddToCartFailed) {
              showedScaffoldMessage(
                context: context,
                message: state.errorMessage,
              );
            }
          },
        ),
      ],
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CachedNetworkImage(
                  imageUrl: items[activeIndex],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            backgroundColor: AppColors.kWhitePrimaryColor,
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
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AddRemoveToFavorietsButton(
                  productModel: widget.productModel,
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
                    widget.productModel.title,
                    style: AppStyles.styleRegular24(context),
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RatingWidget(
                        reviewViewDataModel: ReviewViewDataModel(
                          image: items[0],
                          productId: widget.productModel.id,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$ ${widget.productModel.price}',
                        style: AppStyles.styleBold27(context),
                      ),
                    ],
                  ),
                  Text(
                    'In Stock: Available',
                    style: AppStyles.styleGreyReg18(context),
                  ),
                  const SizedBox(height: 4),
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
                          child: DetailedListSelectedImage(
                            isActive: activeIndex == index,
                            image: items[index],
                          ),
                        );
                      },
                    ),
                  ),
                  widget.productModel.sizes == [] ||
                          widget.productModel.sizes!.isEmpty
                      ? SizedBox()
                      : Column(
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              S.of(context).SizeGuide,
                              style: AppStyles.styleSemiBold24(context),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                  DetailsViewNumsList(
                    defaultSize: widget.productModel.selectedSize,
                    sizes: widget.productModel.sizes,
                    onSizeSelected: (String size) {
                      setState(() {
                        selectedSize = size;
                        selectedQuantity =
                            widget.productModel.quantityBySize?[size] ?? 0;
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  if (selectedQuantity != null)
                    Text(
                      '$selectedQuantity Items Available',
                      style: AppStyles.styleGreyReg18(context),
                    ),
                  const SizedBox(height: 5),
                  AddToCartButton(
                    productModel: widget.productModel,
                    selectedSize: selectedSize,
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    tilePadding: const EdgeInsets.all(0),
                    shape: Border.all(color: Colors.transparent),
                    title: Text(
                      S.of(context).Description,
                      style: AppStyles.styleSemiBold24(context),
                    ),
                    children: [
                      Text(
                        widget.productModel.description,
                        style: AppStyles.styleRegular17(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
