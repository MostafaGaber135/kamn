import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';

class customAllCategButton extends StatelessWidget {
  const customAllCategButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppPallete.green2,
        border: Border.all(
          color: AppPallete.mediumLightGray,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Center(
        child: Text(
          "All",
          style: TextStyles.fontCircularSpotify10BlackMedium,
        ),
      ),
    );
  }
}

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.currentCateg,
  });
  final Category currentCateg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 42.h,
        width: 92.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppPallete.ofWhiteColor2,
          border: Border.all(
            color: AppPallete.ofWhiteColor4,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: AppPallete.ofWhiteColor3,
              radius: 10.r, // Adjust the size as needed
              child: SvgPicture.asset(
                currentCateg.icon,
                width: 24, // Adjust width
                height: 24, // Adjust height
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: Text(
                currentCateg.name,
                style: TextStyles.fontCircularSpotify10BlackMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
