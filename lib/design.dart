
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryRed = Color.fromRGBO(167, 0, 50, 1);
  static const Color goldenYellow = Color.fromRGBO(255, 218, 68, 1);
  static const Color darkWine = Color.fromRGBO(120, 22, 42, 1);
  static const Color deepBrown = Color.fromRGBO(46, 20, 28, 1);
  static const Color richRed = Color.fromRGBO(165, 0, 49, 1);
  static const Color black = Color.fromRGBO(31, 22, 25, 1);
  static const Color grey = Color.fromRGBO(170, 107, 126, 1);
  static const Color greySecondary = Color.fromRGBO(129, 44, 66, 1);

  static const Color unactiveButtonBorderColor = Color.fromRGBO(128, 44, 66, 1);
  static const Color activeButtonBorderColor = Color.fromRGBO(249, 219, 97, 1);
}

class AppGradients {
  const AppGradients._();

  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.richRed,
      AppColors.black,
    ],
  );

  static const LinearGradient secondary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.darkWine,
      AppColors.deepBrown,
    ],
  );
}


const TextStyle bLargeTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

const TextStyle bTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle bMediumTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const TextStyle nSubtitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

const TextStyle nMediumTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle nLightTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);



const TextStyle lSmallDiscountTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);