import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/credit_card_wodget.dart';

class PaymentMethodsLists extends StatefulWidget {
  const PaymentMethodsLists({
    super.key,
  });

  @override
  State<PaymentMethodsLists> createState() => _PaymentMethodsListsState();
}

class _PaymentMethodsListsState extends State<PaymentMethodsLists> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      Assets.imagesCreditCard4,
      Assets.imagesPaypalLogo,
    ];

    return SizedBox(
      height: 60,
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
    );
  }
}
