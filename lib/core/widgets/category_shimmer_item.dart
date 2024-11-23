import 'package:flutter_course/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerItem extends StatelessWidget {
  const CategoryShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        children: [
          // Shimmer effect for CircleAvatar
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!, // Color of the "empty" state
            highlightColor: Colors.grey[100]!, // Color of the "shimmer" effect
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white,
            ),
          ),
          verticalSpacing(5.sp),
          // Shimmer effect for Text (name)
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 16.sp, // Set the height for the text placeholder
              width: 100.w,  // Set the width for the text placeholder
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
}
}
