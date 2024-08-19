import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

Future<dynamic> uploadPictureShowModalBottomSheet({
  required BuildContext context,
  required void Function()? onTapCamera,
  required void Function()? onTapGallery,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with a close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Picture',
                  style: AppStyles.styleRegular19(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Options
            ListTile(
              leading: const Icon(Ionicons.camera, color: Colors.blue),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                onTapCamera?.call();
              },
            ),
            ListTile(
              leading: const Icon(Ionicons.image, color: Colors.green),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                onTapGallery?.call();
              },
            ),
          ],
        ),
      );
    },
  );
}
