import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';
import 'package:mobile/presentation/components/avatar.dart';
import 'package:mobile/presentation/routes/app_routes.dart';
import 'package:mobile/presentation/screens/home/bloc/home_bloc.dart';
import 'package:mobile/presentation/screens/home/bloc/home_state.dart';
import 'package:mobile/presentation/screens/home/widgets/card_option.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<HomeBloc, HomeState>(listener: (context, state) {
      if (state.status == HomeStatus.success) {
        EasyLoading.dismiss();
      }
    }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      final user = state.user;
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.white,
        appBar: AppBarWidget(
          icon: Icons.menu,
          onPressLeftButton: () {
            print("object");
            if (_scaffoldKey.currentState == null) {
              print("Scaffold key is null");
            } else {
              _scaffoldKey.currentState?.openDrawer();
            }
          },
        ),
        drawer: Drawer(
          backgroundColor: AppColors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.mountainMeadow,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                        style: AppTextStyles.montserratStyle.bold14White,
                      ),
                      Text(
                        user?.email ?? '',
                        style: AppTextStyles.montserratStyle.regular12White,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  size: 23,
                ),
                title: Text(
                  Constants.privacy,
                  style: AppTextStyles.montserratStyle.regular12Black,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/privacy-policy');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  size: 23,
                ),
                title: Text(
                  Constants.purchaseHistory,
                  style: AppTextStyles.montserratStyle.regular12Black,
                ),
                onTap: () {
                  // Handle navigation or action
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  size: 23,
                ),
                title: Text(
                  Constants.helpSupport,
                  style: AppTextStyles.montserratStyle.regular12Black,
                ),
                onTap: () {
                  // Handle navigation or action
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 23,
                ),
                title: Text(
                  Constants.settings,
                  style: AppTextStyles.montserratStyle.regular12Black,
                ),
                onTap: () {
                  // Handle navigation or action
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  size: 23,
                ),
                title: Text(
                  Constants.logout,
                  style: AppTextStyles.montserratStyle.regular12Black,
                ),
                onTap: () {
                  // Handle navigation or action
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Text(Constants.parkingLot,
                style: AppTextStyles.montserratStyle.black20Bold),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Avatar(
                imageUrl: '',
                widthAvatar: 80,
                heightAvatar: 80,
                radiusAvatar: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user != null) ...[
                    Text(
                      '${user.firstName ?? ''} ${user.lastName ?? ''}',
                    ),
                    Text(
                      user.email ?? '',
                    ),
                    Text(
                      user.vehicles != null &&
                              (user.vehicles?.isNotEmpty ?? false)
                          ? user.vehicles!.map((v) => v.plateNumber).join(', ')
                          : 'No Plate Info',
                    ),
                  ]
                ],
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10,
              children: [
                CardOption(
                    name: Constants.notification,
                    icon: const Icon(Icons.circle_notifications,
                        color: AppColors.mountainMeadow, size: 40),
                    onPress: () {}),
                CardOption(
                    name: Constants.viewIncommingRides,
                    icon: const Icon(Icons.person_3_outlined,
                        color: AppColors.mountainMeadow, size: 40),
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.paymentHistory);
                    }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              children: [
                CardOption(
                    name: Constants.parkingHistory,
                    icon: const FaIcon(
                      FontAwesomeIcons.globe,
                      size: 40.0,
                      color: AppColors.mountainMeadow,
                    ),
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.parkingHistory);
                    }),
                CardOption(
                    name: Constants.contactPolice,
                    icon: const FaIcon(
                      FontAwesomeIcons.addressBook,
                      size: 40.0,
                      color: AppColors.mountainMeadow,
                    ),
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.contactPolice);
                    }),
              ],
            ),
          ],
        ),
      );
    }));
  }
}
