import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/utils/locale_helper.dart';
import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final bool readOnly;
  final Color? readOnlyColor;
  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final double? borderRadius;
  final VoidCallback? onTap;
  final int maxLines;
  final bool obscure;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  final Color? hintColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChange;

  const AppTextField({
    super.key,
    this.hint,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.readOnlyColor,
    this.maxLines = 1,
    this.obscure = false,
    this.suffixIcon,
    this.suffixIconSize,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.hintColor,
    this.inputFormatters,
    this.textDirection,
    this.textAlign,
    this.onChange, this.prefixIcon, this.prefixIconSize, this.borderRadius, this.borderColor,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextDirection _getTextDirection() {
    return getLocaleString() == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }

  TextAlign _getTextAlign() {
    return getLocaleString() == 'ar' ? TextAlign.right : TextAlign.left;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.maxLines > 1 ? null : 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        color: widget.readOnly
            ? widget.readOnlyColor ??
                ColorConstants.textSecondaryColor.withValues(alpha: 0.1)
            : null,
      ),
      child: TextFormField(
        onChanged: widget.onChange,
        textCapitalization: widget.textCapitalization,
        textDirection: widget.textDirection ?? _getTextDirection(),
        textAlign: widget.textAlign ?? _getTextAlign(),
        focusNode: widget.focusNode,
        obscureText: widget.obscure,
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        style: Styles.body(color: ColorConstants.darkBlue),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          hintStyle: Styles.hint(),
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxWidth: widget.suffixIconSize ?? 20,
            maxHeight: widget.suffixIconSize ?? 20,
          ),
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: BoxConstraints(
            maxWidth: widget.prefixIconSize ?? 20,
            maxHeight: widget.prefixIconSize ?? 20,
          ),
          hintText: widget.hint?.tr(),
          labelStyle: TextStyle(
            fontSize: 12,
            color: ColorConstants.darkBlue,
          ),
          border: _borderSide(),
          enabledBorder: _borderSide(),
          focusedBorder: _borderSide(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderSide() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(
        color: widget.borderColor ??  ColorConstants.borderColor,
      ),
    );
  }
}
