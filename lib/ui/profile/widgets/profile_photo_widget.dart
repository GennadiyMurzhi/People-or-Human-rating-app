import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePhotoWidget extends StatelessWidget {
  final String? photoUrl;

  const ProfilePhotoWidget({Key? key, this.photoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double width = 170;
    const double height = 170;

    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withAlpha(75),
              offset: const Offset(4, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            photoUrl != null
                ? CachedNetworkImage(
                    imageUrl: photoUrl!,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : SvgPicture.asset(
                    'resources/images/svg/person.svg',
                    width: width,
                    height: height,
                  ),
            ClipRect(
              clipper: _ClipForButton(),
              child: Container(
                width: width,
                height: height,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x51000000),
                ),
                child: Container(
                  width: width * 0.4,
                  height: height * 0.4,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_a_photo,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height,
              child: Material(
                color: const Color(0x00000000),
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.secondary.withAlpha(150),
                  borderRadius: BorderRadius.circular(120),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ));
  }
}

class _ClipForButton extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return Rect.fromPoints(
      Offset(0, size.height * 0.6),
      Offset(size.width, size.height),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
