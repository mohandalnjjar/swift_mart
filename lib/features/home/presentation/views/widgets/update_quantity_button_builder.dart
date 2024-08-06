import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:swift_mart/features/home/presentation/managers/Update_quantity_cubit/update_quantity_cubit.dart';

class UpdateQuantityButtonBuilder extends StatelessWidget {
  const UpdateQuantityButtonBuilder({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateQuantityCubit(
        homeRepoImpl: HomeRepoImpl(),
      ),
      child: BlocConsumer<UpdateQuantityCubit, UpdateQuantityState>(
        builder: (context, state) {
          return Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<UpdateQuantityCubit>(context)
                        .updateQuantity(
                      productModel: productModel,
                      increase: true,
                    );
                  },
                  child: const Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.kPrimaryColor,
                    size: 27,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  state is UpdateQuantitySuccess
                      ? state.quantity.toString()
                      : productModel.quantity.toString(),
                  style: AppStyles.styleRegular18(context),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    BlocProvider.of<UpdateQuantityCubit>(context)
                        .updateQuantity(
                      productModel: productModel,
                      increase: false,
                    );
                  },
                  child: const Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.kPrimaryColor,
                    size: 27,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, UpdateQuantityState state) {
          if (state is UpdateQuantityFailed) {
            showedScaffoldMessage(
                context: context, message: state.errorMessage);
          }
        },
      ),
    );
  }
}
