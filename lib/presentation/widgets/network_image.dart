import 'package:cached_network_image/cached_network_image.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';

import '../../gen/assets.gen.dart';

class NetworkImageLoader extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final String? placeholderPath;
  final double? cornerRadius;
  final double cornerRadiusTopRight;
  final double cornerRadiusTopLeft;
  final double cornerRadiusBottomRight;
  final double cornerRadiusBottomLeft;
  final BoxFit fit;

  const NetworkImageLoader({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.placeholderPath,
    this.cornerRadius,
    this.fit = BoxFit.cover,
    this.cornerRadiusBottomLeft = 0,
    this.cornerRadiusBottomRight = 0,
    this.cornerRadiusTopLeft = 0,
    this.cornerRadiusTopRight = 0,
  });

  @override
  State<NetworkImageLoader> createState() => _NetworkImageLoaderState();
}

class _NetworkImageLoaderState extends State<NetworkImageLoader> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft:
            Radius.circular(widget.cornerRadius ?? widget.cornerRadiusTopLeft),
        topRight:
            Radius.circular(widget.cornerRadius ?? widget.cornerRadiusTopRight),
        bottomLeft: Radius.circular(
            widget.cornerRadius ?? widget.cornerRadiusBottomLeft),
        bottomRight: Radius.circular(
            widget.cornerRadius ?? widget.cornerRadiusBottomRight),
      ),
      child: CachedNetworkImage(
        width: widget.width,
        height: widget.height,
        imageUrl: widget.imageUrl ?? '',
        fit: widget.fit,
        progressIndicatorBuilder: (context, _, progress) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          return placeHolder();
        },
      ),
    );
  }

  Widget placeHolder() {
    return SvgIcon(
      path: widget.placeholderPath ?? MyAssets.images.svg.imagePlaceholder.path,
      size: widget.width,
    );
  }
}
