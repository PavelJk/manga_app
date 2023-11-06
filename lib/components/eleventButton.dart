import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manga_app/style/color_app.dart';
import 'package:manga_app/style/text_app.dart';

class CreateEleventButton {
  Widget firstOrLogOrSignPage(
      {required String nameButton,
      required BuildContext context,
      required String pathNameNavigator}) {
    return SizedBox(
      width: double.infinity,
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(pathNameNavigator);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorApp.violet.withOpacity(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(width: 1, color: ColorApp.white)),
        ),
        child: Text(
          nameButton,
          style: TextStyleApp.bodyOne,
        ),
      ),
    );
  }
  Widget googleYandexVK({required String assetSvg}) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            side: BorderSide(color: ColorApp.violet),
          ),
        ),
        child: SvgPicture.asset(assetSvg),
      ),
    );
  }
}
