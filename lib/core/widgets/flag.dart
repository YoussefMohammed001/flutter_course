import 'package:flutter_course/core/widgets/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      alignment: Alignment.bottomLeft,
      child: AppAssetImage(
        image: "flag",
        height: 269.h,
        width: 311.w,
        topLeftRadius: 0,
        topRightRadius: 0,
        bottomLeftRadius: 0,
        bottomRightRadius: 0,
        fit: BoxFit.fill,
      ),
    );
  }
}
