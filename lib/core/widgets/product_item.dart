import 'package:flutter_course/core/routing/routes.dart';
import 'package:flutter_course/core/shared_preferences/my_shared.dart';
import 'package:flutter_course/core/styles/colors.dart';
import 'package:flutter_course/core/utils/navigators.dart';
import 'package:flutter_course/core/utils/spacing.dart';
import 'package:flutter_course/core/utils/svg.dart';
import 'package:flutter_course/core/widgets/app_image.dart';
import 'package:flutter_course/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.isLoading = true, required this.image, required this.name, required this.price, required this.oldPrice, required this.inFav, required this.inCart, required this.storeName}); // Default to false
  final bool isLoading; // Add a loading state parameter
final String image,name,price,oldPrice,inFav,inCart,storeName;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 213.h,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.grey

        ),
      ),
      child: isLoading ? _buildShimmer() : InkWell(
          onTap: (){
          },
          child: _buildContent()), // Use shimmer or content based on loading state
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpacing(5),
          // Shimmer for favorite icon
          Container(
            alignment: Alignment.topRight,
            child: Container(
              width: 30.sp,
              height: 30.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          verticalSpacing(5),
          // Shimmer for product image
          Container(
            width: 54.sp,
            height: 54.sp,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          verticalSpacing(5),
          // Shimmer for product name
          Container(
            width: 80.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(5),
          // Shimmer for store name
          Container(
            width: 50.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(5),
          // Shimmer for price
          Container(
            width: 70.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          Spacer(),
          // Shimmer for add to cart text
          Container(
            width: 60.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpacing(5),
        Container(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 15.r,

            backgroundColor: AppColors.darkGrey.withOpacity(0.5),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 15.sp,
            ),
          ),
        ),
        AppImage(imageUrl:image ,
            width: 60.w, height: 60.h,
            borderRadius: BorderRadius.circular(100.r)),
        verticalSpacing(5),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite: AppColors.notPureBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        verticalSpacing(5),
        Text(
          storeName,
          style: TextStyle(
            color:MyShared.getThemeMode() == ThemeMode.dark ? AppColors.grey: AppColors.darkGrey,
          ),
        ),
        verticalSpacing(5),
        Text(
          price,
          style: TextStyle(
            color: AppColors.moreGold,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S().addToCart,
              style: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            horizontalSpacing(5),
            AppSVG(assetName:  MyShared.getThemeMode() == ThemeMode.dark ? "add_to_cart_pd":"add_to_cart_home",
            ),
          ],
        ),
        verticalSpacing(10),
      ],
    );
  }




}