import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

/// @author: xiao
/// created on: 2025/1/24 10:55
/// description:

class AssetsUtils {
  static Widget getPlatformSvg(var platformType, {double size = 30}) {
    if (platformType == 0) {
      return SvgPicture.asset('assets/jingd.svg', width: size, height: size);
    } else if (platformType == 1) {
      return SvgPicture.asset('assets/zhaoh.svg', width: size, height: size);
    } else {
      return SvgPicture.asset('assets/zfb.svg', width: size, height: size);
    }
  }
}
