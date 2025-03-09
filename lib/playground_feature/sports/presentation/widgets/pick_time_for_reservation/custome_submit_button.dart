import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';

class CustomeSubmitButton extends StatelessWidget {
  final PlaygroundModel playground;
  final DateTime selectedDate;
   const CustomeSubmitButton(
      {super.key, required this.playground, required this.selectedDate});
 

   
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickTimeForReservationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              disabledBackgroundColor: AppPallete.blackColor,
              backgroundColor: AppPallete.blackColor),
          onPressed: () {
     
            // cubit.onSubmitReservation(perpareReservation(cubit));
            if (cubit.viewModel.selectedIntervals.isNotEmpty) {
              Navigator.pushNamed(context, Routes.paymentOptionsScreen,
                  arguments: perpareReservation(context, cubit));
            } else {
              showSnackBar(context, 'At least select one interval');
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: AppPallete.lightGreen),
              horizontalSpace(7.w),
              Text(
                Constants.finish,
                style: TextStyles.fontInter16WhiteMedium,
              )
            ],
          )),
    );
  }

  ReservationModel perpareReservation(
    BuildContext context,
    PickTimeForReservationCubit cubit,
  ) {
    List<DateTime> selectedDateList =
        cubit.viewModel.selectedIntervals.entries.expand((entry) {
      return entry.value;
    }).toList();
    selectedDateList.sort((a, b) => a.compareTo(b));
    return ReservationModel(
        ground: playground,
        date: DateTime.now(),
        startAt: selectedDateList.first,
        endAt: selectedDateList.last
            .add(Duration(minutes: playground.period!.toInt())),
        sessions: selectedDateList.map((start) {
          return Session(
              startAt: start,
              endAt: start.add(Duration(minutes: playground.period!.toInt())));
        }).toList(),
        status: 'pending',
       price: (playground.price ?? 0) * selectedDateList.length ,

        user: context.read<AppUserCubit>().state.user);
  }
}
