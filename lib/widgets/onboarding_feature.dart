import 'package:falcon104/utilities/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingFeature extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  final String subTitle;

  const OnBoardingFeature({Key key, this.assetImage, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image(
              image: assetImage,
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
