import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/adaptive_layout.dart';
import 'package:swift_mart/core/utils/widgets/desktop_scaffold_message.dart';
import 'package:swift_mart/core/utils/widgets/mobile_show_scaffold_message.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showedScaffoldMessage(
    {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: AdaptiveLayout(
          mobileLayout: (BuildContext context) {
            return MobileScaaffoldMessage(
              message: message,
            );
          },
          tabletLayout: (BuildContext context) {
            return DesktopScaffoldMessage(
              message: message,
            );
          },
          desktopLayout: (BuildContext context) {
            return DesktopScaffoldMessage(
              message: message,
            );
          },
        ),
      ),
    ),
  );
}
