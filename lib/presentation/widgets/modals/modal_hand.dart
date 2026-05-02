import 'package:flutter/material.dart';

import '../../../domain/utils/ui_helper.dart';

class ModalHand extends StatelessWidget {
  const ModalHand({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: normalPadding),
        width: 60,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
