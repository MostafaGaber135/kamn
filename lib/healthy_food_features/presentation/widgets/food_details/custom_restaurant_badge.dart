import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';

class CustomRestaurantBadge extends StatelessWidget {
  const CustomRestaurantBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5, offset: Offset(0, 3))
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.restaurant, color: Colors.redAccent, size: 20.w),
              SizedBox(width: 6.w),
              CustomText(Constants.restaurantName, 14.sp, FontWeight.bold,
                  color: Colors.redAccent),
            ],
          ),
        ),
      ],
    );
  }
}
