import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/custom_button.dart';
import 'package:mobile/presentation/components/custom_logo.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  final PageController _pageController = PageController();
  final List<String> images = [
    'https://img.freepik.com/free-photo/top-view-electric-cars-parking-lot_23-2148972403.jpg?w=1380&t=st=1700583598~exp=1700584198~hmac=a71fa1f3ab8158578bb3e462280973ed2e4597864bf9eba7eff3db45ec29f730',
    'https://img.freepik.com/premium-photo/cars-parked-road_10541-812.jpg?w=1060',
    'https://img.freepik.com/premium-photo/cars-parking-lot-evening-light-sun_150893-219.jpg?w=1060',
  ];

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CustomLogo(),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: _currentPage == index ? 30 : 10,
                    decoration: BoxDecoration(
                      color: AppColors.mountainMeadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                Constants.welcome,
                style: AppTextStyles.montserratStyle.bold16Black,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  CustomButton(
                    width: width * 0.88,
                    height: 50,
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    text: Constants.next,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    width: width * 0.88,
                    height: 50,
                    backgroundColor: AppColors.aeroBlue,
                    borderColor: AppColors.aeroBlue,
                    textStyle:
                        AppTextStyles.montserratStyle.bold12MountainMeadow,
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    text: Constants.skip,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
