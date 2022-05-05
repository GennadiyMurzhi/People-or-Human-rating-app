import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IsPhotoWidget extends StatelessWidget {
  final String? photoUrl;
  final double diameter;

  const IsPhotoWidget({
    Key? key,
    required this.photoUrl,
    required this.diameter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return photoUrl != null
        ? CachedNetworkImage(
            imageUrl: photoUrl!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : SvgPicture.asset(
            'resources/images/svg/person.svg',
            width: diameter,
            height: diameter,
          );
  }
}
