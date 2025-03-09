import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero, // No extra height
      child: Container(
        width: double.infinity,
        height: 80.h, // Exact height
        decoration: BoxDecoration(
            color: AppPallete.ofWhiteColor4,
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: AppPallete.ofWhiteColor,
                style: BorderStyle.solid,
              ),
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35.r),
              topLeft: Radius.circular(35.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Fix alignment issue
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Show services",
                  style: TextStyles.fontCircularSpotify12WhiteRegular,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(170.w, 50.h),
                  padding: EdgeInsets.zero, // Remove extra padding
                  backgroundColor: AppPallete.green,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(IconLinks.cart),
                    SizedBox(width: 5.w), // Space between icon & text
                    Text(
                      "2",
                      style: TextStyles.fontCircularSpotify12WhiteRegular,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(130.w, 50.h),
                  padding: EdgeInsets.zero, // Remove extra padding
                  backgroundColor: AppPallete.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
