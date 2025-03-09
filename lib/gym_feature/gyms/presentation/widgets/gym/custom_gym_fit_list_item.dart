import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomGymFitListItem extends StatelessWidget {
  const CustomGymFitListItem(
      {super.key,
      required this.name,
      required this.description,
      required this.onTap,
      required this.image});
  final String name;
  final String description;
  final VoidCallback onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 16.h,
                  width: 76.w,
                  decoration: BoxDecoration(
                      color: AppPallete.whiteColor,
                      borderRadius: BorderRadius.circular(20.h)),
                  padding: const EdgeInsets.all(2),
                  child: FittedBox(
                    child: Text(
                      description,
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 15.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: AppPallete.whiteColor,
                      borderRadius: BorderRadius.circular(20.h)),
                  padding: const EdgeInsets.all(2),
                  child: const FittedBox(
                      child: Icon(
                    Icons.arrow_forward,
                    color: AppPallete.accentBlackColor,
                  )),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                name,
                style: TextStyles.fontCircularSpotify15WhiteMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
