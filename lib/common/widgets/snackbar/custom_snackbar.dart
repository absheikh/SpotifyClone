import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar({
  required BuildContext context,
  required String title,
  required String message,
  required ContentType contentType,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).viewInsets.top + 50,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ),
    ),
  );

  // Insert the overlay
  overlay.insert(overlayEntry);

  // Remove it after the duration
  Future.delayed(duration, () => overlayEntry.remove());
}
