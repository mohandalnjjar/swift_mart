import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/payment/data/repos/check_out_repo_impl.dart';
import 'package:swift_mart/features/payment/presentation/managers/payment_cubit/payment_cubit.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/payment_sheet_widget.dart';
import 'package:swift_mart/generated/l10n.dart';

class CartButtomSheetWidget extends StatelessWidget {
  const CartButtomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            17,
          ),
          topRight: Radius.circular(
            17,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).TotalPrice,
                  style: AppStyles.styleRegular20(context),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money_outlined,
                      color: Colors.green,
                    ),
                    Text(
                      '2394',
                      style: AppStyles.styleSemiBold19(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(
                        CheckOutRepoImpl(),
                      ),
                      child: const PaymentSheetWidget(),
                    );
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                );
              },
              child: Text(
                'Complete Payment',
                style: AppStyles.styleSemiBold18(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
