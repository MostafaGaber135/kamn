import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';
import 'package:kamn/healthy_food_features/data/models/restaurant_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_meal_item/custom_meal_item.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_res_view/custom_categ_item.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_res_view/custom_navbar.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  bool isExpandText = false;
  @override
  Widget build(BuildContext context) {
    Restaurant currentRestaurant = restaurants[0];

    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(right: 12.w, left: 13.w, top: 30.h),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_circle_left_rounded)),
                    horizontalSpace(10),
                    Text(
                      currentRestaurant.name,
                      style: TextStyles.fontCircularSpotify21BlackMedium,
                    ),
                  ],
                ),
                ////restaurant pic
                Container(
                    //alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    width: 345.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18.r)),
                        image: DecorationImage(
                            image: AssetImage(currentRestaurant.imageUrl),
                            fit: BoxFit.fill)),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: AppPallete.whiteColor,
                          radius: 25.r, // Adjust the size as needed
                          child: SvgPicture.asset(
                            IconLinks.addtofavRest,
                            width: 24.w, // Adjust width
                            height: 24.h, // Adjust height
                          ),
                        ),
                      ),
                    )),

                //////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentRestaurant.name,
                          style: TextStyles.fontCircularSpotify21BlackBold,
                        ),
                        Row(children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppPallete.grayColor,
                            size: 10.sp,
                          ),
                          Text("Location",
                              style: TextStyles.fontCircularSpotify10GrayRegular
                              //fontCircularSpotify10Gray2Regular,
                              ),
                        ])
                      ],
                    ),
                    Container(
                      height: 34.h,
                      width: 77.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: AppPallete.ofWhiteColor4,
                        border: Border.all(color: AppPallete.ofWhiteColor),
                        borderRadius: BorderRadius.all(Radius.circular(25.r)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            currentRestaurant.rating.toString(),
                            style: TextStyles.fontCircularSpotify14BlackRegular,
                          ),
                          Icon(
                            Icons.star,
                            color: AppPallete.lightOrangeColor,
                            size: 15.sp,
                          )
                        ],
                      ),
                    )
                  ],
                ),

                ///description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Column(
                    children: [
                      Text(
                        currentRestaurant.description,
                        overflow: isExpandText
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: TextStyles.fontCircularSpotify14GrayRegular,
                        maxLines: isExpandText ? null : 3,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandText = true;
                            });
                          },
                          child: isExpandText
                              ? SizedBox.shrink()
                              : Text(
                                  "...see more",
                                  style: TextStyles
                                      .fontCircularSpotify14GrayRegular,
                                ))
                    ],
                  ),
                ),

                /////categories
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    Constants.catrgories,
                    style: TextStyles.fontCircularSpotify16BlackMedium,
                  ),
                ),
                SizedBox(
                  height: 42.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: currentRestaurant.categories.map((category) {
                      return category.name == "All"
                          ? customAllCategButton()
                          : CustomCategoryItem(
                              currentCateg: category,
                            );
                    }).toList(),
                  ),
                ),

                ///mealitems
                Expanded(
                  //height: 170.h,
                  child: ListView.builder(
                    itemCount: trendingFoods.length,
                    itemBuilder: (context, index) {
                      return CustomMealItem(currentMeal: trendingFoods[index]);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
