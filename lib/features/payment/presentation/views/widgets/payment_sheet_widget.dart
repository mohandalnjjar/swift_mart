import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:swift_mart/generated/l10n.dart';

class PaymentSheetWidget extends StatelessWidget {
  const PaymentSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).TotalPrice,
                  style: AppStyles.styleRegular22(context),
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
            const Spacer(),
            const CustomButtonBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
