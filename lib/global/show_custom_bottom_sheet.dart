import 'package:flutter/material.dart';

void showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  required double height,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
          ),
        ],
      ),
      child: child,
    ),
  );
}
