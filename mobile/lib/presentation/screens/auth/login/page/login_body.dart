import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_icons.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/custom_button.dart';
import 'package:mobile/presentation/components/custom_edit_text.dart';
import 'package:mobile/presentation/components/custom_logo.dart';
import 'package:mobile/presentation/routes/app_routes.dart';
import 'package:mobile/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:mobile/presentation/screens/auth/login/bloc/login_event.dart';
import 'package:mobile/presentation/screens/auth/login/bloc/login_state.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordShown = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.pushNamed(
            context,
            AppRoutes.mainScreen,
          );
        } else if (state.status == LoginStatus.processing) {
          EasyLoading.show();
        }
      },
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            Fluttertoast.showToast(msg: Constants.loginSuccessful);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),
                      const CustomLogo(),
                      const SizedBox(height: 48),
                      CustomEditText(
                        title: Constants.userName,
                        hintText: Constants.enterYourUserName,
                        initialValue: state.username,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              LoginChangeEmailPasswordEvent(
                                  username: value, password: state.password));
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomEditText(
                        title: Constants.password,
                        hintText: Constants.enterYourPassword,
                        isPasswordInput: true,
                        initialValue: state.password,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              LoginChangeEmailPasswordEvent(
                                  username: state.username, password: value));
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                            activeColor: AppColors.mountainMeadow,
                          ),
                          Text(
                            Constants.rememberPassword,
                            style: AppTextStyles.montserratStyle.regular10Black,
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text(
                              Constants.forgotPassword,
                              style: AppTextStyles
                                  .montserratStyle.regular10MountainMeadow,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: Constants.login,
                        onTap: () {
                          context
                              .read<LoginBloc>()
                              .add(LoginWithUsernamePasswordEvent());
                        },
                        height: 50,
                        width: 260,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(color: AppColors.cadetGrey)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(Constants.orLoginWith,
                                style: AppTextStyles
                                    .montserratStyle.regular10DimGray),
                          ),
                          const Expanded(
                              child: Divider(color: AppColors.cadetGrey)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: IconButton(
                          icon: Image.asset(
                            AppIcons.google.pngAssetPath,
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          text: Constants.dontHaveAccount,
                          style: AppTextStyles.montserratStyle.regular13DimGray,
                          children: [
                            TextSpan(
                                text: Constants.register,
                                style:
                                    AppTextStyles.montserratStyle.bold13Black,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.register);
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
