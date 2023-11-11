import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manga_app/style/color_app.dart';

class VkYandexGoogleButton extends StatefulWidget {
  final assetSvg;
  const VkYandexGoogleButton({super.key, this.assetSvg});

  @override
  State<VkYandexGoogleButton> createState() => _VkYandexGoogleButtonState();
}

class _VkYandexGoogleButtonState extends State<VkYandexGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            side: BorderSide(color: ColorApp.violet),
          ),
        ),
        child: SvgPicture.asset(widget.assetSvg),
      ),
    );
  }
}

