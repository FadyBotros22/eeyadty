import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_helper.dart';
import '../../../gen/assets.gen.dart';
import '../svg_icon.dart';
import 'app_text_field.dart';

class AppLabeledTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String? endText;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final bool readOnly;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final Color? readOnlyColor;
  final Function(String?)? onChange;

  const AppLabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.maxLines,
    this.textDirection,
    this.textAlign,
    this.onChange, this.endText, this.readOnlyColor,
  });

  @override
  State<AppLabeledTextField> createState() => _AppLabeledTextFieldState();
}

class _AppLabeledTextFieldState extends State<AppLabeledTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          widget.label,
          textStyle: Styles.headline(),
        ),
        const Height(6),
        AppTextField(
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          readOnlyColor: widget.readOnlyColor ?? Colors.transparent,
          inputFormatters: widget.inputFormatters,
          suffixIcon: widget.readOnly
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if(widget.endText != null)...[
                        AppText(widget.endText!),
                        const Width(4)
                      ],
                      SvgIcon(
                        path: MyAssets.images.svg.arrowDown.path,
                      ),
                    ],
                  ),
                )
              : null,
          suffixIconSize: widget.endText == null ? 45 : 71,
          hint: widget.hint,
          maxLines: widget.maxLines ?? 1,
          onChange: widget.onChange,
        ),
      ],
    );
  }
}
