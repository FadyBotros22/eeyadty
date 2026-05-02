import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';
import '../../gen/locale_keys.g.dart';


class DynamicWidthTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final Function(String) onChange;

  const DynamicWidthTextField({
    super.key,
    required this.controller,
    required this.enabled,
    required this.onChange,
  });

  @override
  State<DynamicWidthTextField> createState() => _DynamicWidthTextFieldState();
}

class _DynamicWidthTextFieldState extends State<DynamicWidthTextField> {
  double _textWidth = 50.0;

  @override
  void initState() {
    super.initState();
    _updateWidth();
    widget.controller.addListener(_updateWidth);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateWidth);
    super.dispose();
  }

  void _updateWidth() {
    final text = widget.controller.text.isEmpty
        ? LocaleKeys.createBookingCompletedScreenEnterCode.tr()
        : widget.controller.text;

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    setState(() {
      _textWidth = textPainter.width + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.enabled
        ? SizedBox(
      width: MediaQuery.of(context).size.width - 140,
      child: _buildTextField(),
    )
        : IntrinsicWidth(
      child: SizedBox(
        width: _textWidth,
        child: _buildTextField(),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      style: Styles.subBody(fontSize: 16),
      decoration: InputDecoration(
        hintText: LocaleKeys.createBookingCompletedScreenEnterCode.tr(),
        hintStyle: Styles.subBody(
          fontSize: 16,
          color: ColorConstants.primaryColor40,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onChanged: widget.onChange,
    );
  }
}
