import 'package:cached_network_image/cached_network_image.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';

class CircleNetworkImageLoader extends StatefulWidget {
  final String? imageUrl;
  final double radius;
  final String? placeholderPath;
  final double cornerRadius;
  final Color? color;
  final double borderWidth;
  final Color? borderColor;
  final String? initialsPlaceHolder;

  const CircleNetworkImageLoader({
    super.key,
    this.imageUrl,
    required this.radius,
    this.placeholderPath,
    this.initialsPlaceHolder,
    this.cornerRadius = 0,
    this.color,
    this.borderWidth = 0,
    this.borderColor,
  });

  @override
  State<CircleNetworkImageLoader> createState() =>
      _CircleNetworkImageLoaderState();
}

class _CircleNetworkImageLoaderState extends State<CircleNetworkImageLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius,
      height: widget.radius,
      decoration: BoxDecoration(
          border: widget.borderWidth == 0
              ? null
              : Border.all(
                  width: widget.borderWidth,
                  color: widget.borderColor ??
                      ColorConstants.primaryColor4,
                ),
          shape: BoxShape.circle),
      child: widget.imageUrl?.isEmpty ?? true
          ? placeHolder()
          : ClipOval(
              child: CachedNetworkImage(
                width: widget.radius,
                height: widget.radius,
                imageUrl: widget.imageUrl!,
                colorBlendMode: BlendMode.src,
                color: widget.color,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, _, progress) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return placeHolder();
                },
              ),
            ),
    );
  }

  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    for (var part in names) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials.toUpperCase();
  }

  Widget placeHolder() {
    return widget.initialsPlaceHolder != null
        ? CircleAvatar(
            radius: widget.radius, // Adjust the size as needed
            backgroundColor:
                ColorConstants.grey, // Placeholder background color
            child: AppText(
              getInitials(widget.initialsPlaceHolder!),
              textStyle: TextStyle(
                  color: ColorConstants.darkBlue,
                  fontSize: widget.radius * 0.5), // Adjust text color and size
            ),
          )
        : widget.placeholderPath != null
            ? SvgIcon(
                path: widget.placeholderPath!,
                size: widget.radius,
                color: widget.color,
              )
            : Container(
                color: ColorConstants.white,
                child: Center(
                  child: CupertinoActivityIndicator(
                    color: ColorConstants.darkBlue,
                  ),
                ),
              );
  }
}
