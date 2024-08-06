import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/credit_card_wodget.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/custom_button_bloc_consumer.dart';

class PaymentSheetWidget extends StatefulWidget {
  const PaymentSheetWidget({
    super.key,
  });

  @override
  State<PaymentSheetWidget> createState() => _PaymentSheetWidgetState();
}

class _PaymentSheetWidgetState extends State<PaymentSheetWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      Assets.imagesCreditCard,
      Assets.imagesPaypal,
    ];

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .25,
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
            Text(
              'Choose Payment Way',
              style: AppStyles.styleSemiBold19(context),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 68,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (activeIndex != index) {
                        setState(() {
                          activeIndex = index;
                        });
                      }
                    });
                  },
                  child: CreditCardWodget(
                    isActive: activeIndex == index,
                    image: items[index],
                  ),
                ),
              ),
            ),
            const Spacer(),
            const CustomButtonBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
