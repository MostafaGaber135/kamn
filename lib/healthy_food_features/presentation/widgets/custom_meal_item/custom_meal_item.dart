import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/limit_lists.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

class CustomMealItem extends StatelessWidget {
  const CustomMealItem({super.key, required this.currentMeal});
  final FoodItem currentMeal;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 150.h,
        width: 160.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Card(
            //   margin: EdgeInsets.only(top: 28),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(25.r)),
            //   elevation: 8,
            //   color: AppPallete.ofWhiteColor,
            //   // color: Colors.transparent,
            //   child: SizedBox(
            //     height: 145.h,
            //     width: 160.w,
            //   ),
            // ),
            Align(
              alignment: Alignment(0, 1.h),
              //  top: 30,

              // borderRadius:
              //     BorderRadius.circular(25.r), // Ensure correct border radius
              child: Container(
                height: 150.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  gradient: LinearGradient(
                    colors: [
                      // AppPallete.green,
                      // Color.fromARGB(232, 231, 156, 121),
                      Color(0x00FFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(
                          150, 150, 154, 0.15), // Transparent shadow
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),

                // child: Card(
                //   margin: EdgeInsets.only(top: 28),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(25.r)),
                //   elevation: 8,
                //   // color: AppPallete.ofWhiteColor,
                //   // color: Colors.transparent,
                //   child: SizedBox(
                //     height: 145.h,
                //     width: 160.w,
                //   ),
                // ),
              ),
            ),
            Container(
              height: 190.h,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      currentMeal.imageUrl,
                      height: 95.h,
                      // scale: 7,
                    ),
                  ),
                  Text("🔥 ${currentMeal.calories}kcal",
                      style: TextStyles.fontCircularSpotify8GrayRegular),
                  Text(
                    currentMeal.name,
                    // textAlign: TextAlign.center,

                    style: TextStyles.fontCircularSpotify12BlackMedium,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    // textWidthBasis: TextWidthBasis.,
                  ),
                  Text(limitTags(currentMeal.tags, 20),
                      //currentMeal.tags.length >20 ? "${currentMeal.tags.substring(0, 20)}..." : currentMeal.tags,
                      //currentMeal.tags.join(","),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.fontCircularSpotify8GrayRegular),
                  Row(
                    children: [
                      Text("  ${currentMeal.price} ",
                          // textAlign: TextAlign.center,

                          style: TextStyles.fontCircularSpotify12BlackMedium),
                      Text("£GP",
                          style: TextStyles.fontCircularSpotify10GreenBold),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 15.h,
              right: 5.w,
              child: CircleAvatar(
                radius: 13.r,
                backgroundColor: AppPallete.blackColor,
                child: Icon(
                  Icons.add,
                  color: AppPallete.ofWhiteColor,
                ),
              ),
            )
            // IconButton(onPressed: () {}, icon: Icon)
          ],
        ));
  }
}
