import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import '../../constants/strings/asset_constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath;
  final String? placeImage;
  final BoxFit boxFit;
  final String? blurHash;
  const CustomNetworkImage({
    required this.imagePath,
    this.boxFit = BoxFit.fill,
    Key? key,
    this.blurHash,
    this.placeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      key: Key(DateTime.now().toString()),
      color: theme.scaffoldBackgroundColor,
      child: OctoImage(
        image: CachedNetworkImageProvider(imagePath!),
        errorBuilder: (context, object, stackTrace) {
          return Container(
            key: Key(DateTime.now().toString()),
            color: theme.scaffoldBackgroundColor,
            child: OctoImage(
              key: Key(DateTime.now().toString()),
              placeholderBuilder: blurHash == null
                  ? null
                  : OctoPlaceholder.blurHash(
                      blurHash!,
                      fit: boxFit,
                    ),
              image: CachedNetworkImageProvider(imagePath!),
              errorBuilder: (context, object, stackTrace) {
                return _errorImage(theme);
              },
              fit: boxFit,
            ),
          );
        },
        fit: boxFit,
      ),
    );
  }

  Widget _errorImage(ThemeData theme) {
    return Center(
      child: Image.asset(CoreAssetConstants.errorImage, fit: BoxFit.cover,color: theme.primaryColor,),
    );
  }
}
