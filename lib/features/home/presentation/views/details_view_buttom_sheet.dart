import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/generated/l10n.dart';

class DetailsButtomSheetWidget extends StatelessWidget {
  const DetailsButtomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 20,
        top: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            context.pop();
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Ionicons.cart_outline),
              const SizedBox(
                width: 7,
              ),
              Text(
                S.of(context).AddToCart,
                style: AppStyles.styleSemiBold17(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
