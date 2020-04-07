import 'package:flutter/widgets.dart';

class SizeConfig {
  // MediaQueryData
    // this holds the information of the current media spesfic screen size
    static MediaQueryData _mediaQueryData;
    static double screenWidth;
    static double screenHeight;
    static double blockSizeHorizontal;
    static double blockSizeVertical;

    static double _safeAreaHorizontal;
    static double _safeAreavertical;
    static double safeBlockHorizontal;
    static double safeBlockVertical;

    void init(BuildContext context) {
      _mediaQueryData = MediaQuery.of(context);
      screenWidth = _mediaQueryData.size.width;
      screenHeight = _mediaQueryData.size.height;
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;


      _safeAreaHorizontal = _mediaQueryData.padding.left +
      _mediaQueryData.padding.right;
       _safeAreavertical = _mediaQueryData.padding.top  - 20
      ;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreavertical) / 100;
      
    }
}