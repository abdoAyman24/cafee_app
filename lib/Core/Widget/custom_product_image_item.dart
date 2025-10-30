import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProductImageItem extends StatelessWidget {
  const CustomProductImageItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(15),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: 150,
        height: 150,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
