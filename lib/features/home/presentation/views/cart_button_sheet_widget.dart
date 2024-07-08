import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
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
                S.of(context).Checkout,
                style: AppStyles.style700w16(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
