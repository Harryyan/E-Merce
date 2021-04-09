import 'package:emerce_components/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/data/helpers/full_screen_size.dart';

class Guide extends StatelessWidget {
  const Guide({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "E-Merce",
          style: TextStyle(
            fontSize: FullSizeConfig.getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: FullSizeConfig.getProportionateScreenHeight(265),
          width: FullSizeConfig.getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
