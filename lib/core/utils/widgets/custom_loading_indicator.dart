import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/generated/l10n.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.inAsyncCall,
    this.overlayColor = Colors.grey,
  });

  final bool inAsyncCall;
  final Color overlayColor;

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) {
      return const SizedBox.shrink();
    }

    return AbsorbPointer(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).Loading,
                    style: AppStyles.style700w16(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:swift_mart/core/utils/services/app_text_styles.dart';

// class CustomLoadingIndicator extends StatelessWidget {
//   const CustomLoadingIndicator({
//     super.key,
//     required this.inAsyncCall,
//     this.loadingText = 'Loading...',
//     this.overlayColor = Colors.grey,
//   });

//   final bool inAsyncCall;
//   final String loadingText;
//   final Color overlayColor;

//   @override
//   Widget build(BuildContext context) {
//     if (inAsyncCall) {
      // return Container(
      //   color: overlayColor.withOpacity(0.5),
      //   child: Center(
      //     child: Container(
      //       padding: const EdgeInsets.all(20),
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const CircularProgressIndicator(),
      //           const SizedBox(height: 20),
      //           Text(
      //             loadingText,
      //             style: AppStyles.style700w16(context),
      //           ),
      //         ],             ),
      //     ),
//      ),
//       );
//     } 
//   }
// }
