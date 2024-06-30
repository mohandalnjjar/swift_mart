import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

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
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * .2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 13),
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
                                  'Total Price',
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
                            ElevatedButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(
                                'Checkout',
                                style: AppStyles.style700w16(context),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                'Checkout',
                style: AppStyles.style700w16(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
