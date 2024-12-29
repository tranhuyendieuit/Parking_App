import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';
import 'package:mobile/presentation/routes/app_routes.dart';

import '../bloc/bloc.dart';
import '../widgets/parking_item.dart';

class ParkingListBody extends StatelessWidget {
  const ParkingListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: Constants.parkingList,
        backgroundColor: AppColors.mountainMeadow,
        iconColor: AppColors.white,
        titleStyle: AppTextStyles.montserratStyle.bold16White,
      ),
      body: BlocConsumer<ParkingListBloc, ParkingListState>(
        listener: (context, state) {
          state.status == ParkingListStatus.processing ? EasyLoading.show() : EasyLoading.dismiss();
        },
        builder: (context, state) {
          return RefreshIndicator(
            color: Colors.black,
            onRefresh: () async {
              return context.read<ParkingListBloc>().add(const ParkingListInitialEvent());
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.parkingList.length,
              itemBuilder: (childContext, index) {
                return ParkingItem(
                  item: state.parkingList[index],
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.parkingDetail, arguments: state.parkingList[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
