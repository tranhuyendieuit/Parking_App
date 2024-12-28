import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_icons.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/custom_button.dart';
import 'package:mobile/presentation/components/custom_edit_text.dart';
import 'package:mobile/presentation/components/custom_logo.dart';
import 'package:mobile/presentation/screens/auth/register/bloc/register_bloc.dart';
import 'package:mobile/presentation/screens/auth/register/bloc/register_event.dart';
import 'package:mobile/presentation/screens/auth/register/bloc/register_state.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.failure) {
          Fluttertoast.showToast(
              msg: state.errormessage, toastLength: Toast.LENGTH_LONG);
        }
        if (state.status == RegisterStatus.success) {
          Fluttertoast.showToast(msg: Constants.registerSuccess);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    const CustomLogo(),
                    const SizedBox(height: 48),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomEditText(
                          title: Constants.userName,
                          hintText: Constants.enterYourUserName,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  username: value)),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.password,
                          hintText: Constants.enterYourPassword,
                          isPasswordInput: true,
                          onChanged: (value) =>
                              context.read<RegisterBloc>().add(
                                    RegisterChangeEmailPasswordEvent(
                                      password: value,
                                    ),
                                  ),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.confirmPassword,
                          hintText: Constants.confirmYourPassword,
                          isPasswordInput: true,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  confirmPassword: value)),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomEditText(
                                title: Constants.firstName,
                                hintText: Constants.yourFirstName,
                                onChanged: (value) => context
                                    .read<RegisterBloc>()
                                    .add(RegisterChangeEmailPasswordEvent(
                                        firstName: value)),
                                suffix: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: AppColors.mountainMeadow,
                                    size: 16),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomEditText(
                                title: Constants.lastName,
                                hintText: Constants.yourLastName,
                                onChanged: (value) => context
                                    .read<RegisterBloc>()
                                    .add(RegisterChangeEmailPasswordEvent(
                                        lastName: value)),
                                suffix: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: AppColors.mountainMeadow,
                                    size: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.email,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  email: value)),
                          hintText: Constants.enterYourEmail,
                          suffix: const Icon(Icons.email_outlined,
                              color: AppColors.mountainMeadow, size: 16),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.mobileNumber,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  phoneNumber: value)),
                          hintText: Constants.enterYourMobileNumber,
                          suffix: const Icon(Icons.phone,
                              color: AppColors.mountainMeadow, size: 16),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.vehicleBrand,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  vehicleBrand: value)),
                          hintText: Constants.enterYourVehicleBrand,
                          suffix: const Icon(FontAwesomeIcons.motorcycle,
                              color: AppColors.mountainMeadow, size: 16),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.vehicleModel,
                          hintText: Constants.enterYourVehicleModel,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  vehicleModel: value)),
                          suffix: const Icon(FontAwesomeIcons.motorcycle,
                              color: AppColors.mountainMeadow, size: 16),
                        ),
                        const SizedBox(height: 16),
                        CustomEditText(
                          title: Constants.vehiclePlate,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterChangeEmailPasswordEvent(
                                  vehiclePlate: value)),
                          hintText: Constants.enterYourVehiclePlate,
                          suffix: const Icon(
                            FontAwesomeIcons.motorcycle,
                            color: AppColors.mountainMeadow,
                            size: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: Constants.register,
                          onTap: () {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterWithUsernameEvent());
                          },
                          height: 50,
                          width: 260,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Fixed bottom part
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(color: AppColors.cadetGrey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(Constants.orRegisterWith,
                              style: AppTextStyles
                                  .montserratStyle.regular10DimGray),
                        ),
                        const Expanded(
                            child: Divider(color: AppColors.cadetGrey)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    IconButton(
                      icon: Image.asset(
                        AppIcons.google.pngAssetPath,
                        width: 20,
                        height: 20,
                      ),
                      iconSize: 14,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: Constants.alreadyHaveAnAccount,
                        style: AppTextStyles.montserratStyle.regular13DimGray,
                        children: [
                          TextSpan(
                            text: Constants.login,
                            style: AppTextStyles.montserratStyle.bold13Black,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
