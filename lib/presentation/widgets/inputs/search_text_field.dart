import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';
import '../../../gen/assets.gen.dart';
import '../svg_icon.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onChanged;
  final String hintText;
  final int? debounceValue;
  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.debounceValue,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce =
            Timer(Duration(milliseconds: widget.debounceValue ?? 500), () {
          widget.onChanged(text);
        });
      },
      style: Styles.customStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorConstants.primaryColor40,
      ),
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SvgIcon(
              path: MyAssets.images.svg.icSearch.path,
              size: 20,
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 80, maxWidth: 80),
          filled: true,
          fillColor: const Color(0xffF8F8F8),
          isDense: true,
          hintText: widget.hintText.tr(),
          hintStyle: Styles.customStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorConstants.primaryColor40,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          )),
    );
  }
}
