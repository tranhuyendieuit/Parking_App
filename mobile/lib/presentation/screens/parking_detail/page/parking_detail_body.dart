import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';

import '../bloc/bloc.dart';

class ParkingDetailBody extends StatelessWidget {
  const ParkingDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: Constants.parkingDetail,
        backgroundColor: AppColors.mountainMeadow,
        iconColor: AppColors.white,
        titleStyle: AppTextStyles.montserratStyle.bold16White,
      ),
      body: BlocConsumer<ParkingDetailBloc, ParkingDetailState>(
        listener: (context, state) {
          state.status == ParkingDetailStatus.processing ? EasyLoading.show() : EasyLoading.dismiss();
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.parkingDetail?.address?.isNotEmpty ?? false)
                  RichText(
                    text: TextSpan(
                      text: 'Parking Name: ',
                      style: AppTextStyles.montserratStyle.bold14Black,
                      children: [
                        TextSpan(
                          text: state.parkingDetail?.address ?? '',
                          style: AppTextStyles.montserratStyle.regular14Black,
                        )
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                if (state.parkingDetail?.capacity != null)
                  RichText(
                    text: TextSpan(
                      text: 'Capacity: ',
                      style: AppTextStyles.montserratStyle.bold14Black,
                      children: [
                        TextSpan(
                          text:
                              '${(state.parkingDetail?.capacity ?? 0) - (state.parkingDetail?.occupation ?? 0)} / ${state.parkingDetail?.capacity ?? 0}',
                          style: AppTextStyles.montserratStyle.regular14Black,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
