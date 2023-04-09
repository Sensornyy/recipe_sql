import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_sql/feat/recipes/presentation/widgets/loading_indicator.dart';

class RecipeCacheImage extends StatelessWidget {
  final String url;
  final double width;
  final double? height;

  const RecipeCacheImage(
    this.url, {
    required this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (_, __) {
        return const LoadingIndicator();
      },
    );
  }
}
