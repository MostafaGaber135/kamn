import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_filter.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_list.dart';

class ViewResrvationScreen extends StatelessWidget {
  const ViewResrvationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(context: context,
        color: AppPallete.whiteColor,
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.groundsScreenTitle,
              style: TextStyles.fontRoboto30GreenBold,
            ),
            const CustomReservationFilter(),
            verticalSpace(10),
            // const CustomReservationFilterItem(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       Constants.reservation,
            //       style: Style.font15BlackColorBold,
            //     ),
            //     Text(
            //       Constants.showAll,
            //       style: Style.font10GrayColorW400,
            //     ),
            //   ],
            // ),
            // verticalSpace(5.h),
            // const CustomYourNextMatchTimer(),
            verticalSpace(20),
             const Expanded(child: CustomReservationList())
          ],
        ),
      ),
    );
  }
}
