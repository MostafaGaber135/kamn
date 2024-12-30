import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomPaymentOptionsItem extends StatelessWidget {
  const CustomPaymentOptionsItem(
      {super.key,
      required this.paymentIcon,
      required this.isSelected,
      required this.paymentName,
      required this.onTap});
  final String paymentName;
  final String paymentIcon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
      tileColor: AppPallete.ofWhiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      )),
      leading: SvgPicture.asset(
        paymentIcon,
        width: 25.w,
        height: 25.h,
      ),
      onTap: onTap,
      title: Text(
        paymentName,
        style: TextStyles.font15BlackColorRegular,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppPallete.lightGreenColor.withOpacity(0.3)
              : AppPallete.lgGreyColor,
        ),
        child: CircleAvatar(
          backgroundColor: isSelected
              ? AppPallete.lightGreenColor
              : AppPallete.ligtGreyColor,
          radius: 8.r,
        ),
      ),
    );
  }
}
