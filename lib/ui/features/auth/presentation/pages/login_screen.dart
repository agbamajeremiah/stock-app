import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:stock/core/dependency/injection_container.dart';
import 'package:stock/core/utils/form_validation.dart';
import 'package:stock/ui/features/auth/presentation/providers/auth_provider.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';
import 'package:stock/ui/shared/ui_helpers.dart';
import 'package:stock/ui/shared/widgets/expanded_button.dart';
import 'package:stock/ui/shared/widgets/form_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  late StreamController<String> emailStreamController;
  late StreamController<String> passwordStreamController;
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    emailStreamController = StreamController<String>.broadcast();
    passwordStreamController = StreamController<String>.broadcast();
    _emailController.addListener(() {
      emailStreamController.sink.add(_emailController.text.trim());
      validateInputs();
    });
    _passwordController.addListener(() {
      passwordStreamController.sink.add(_passwordController.text.trim());
      validateInputs();
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailStreamController.close();
    passwordStreamController.close();
  }

  void validateInputs() {
    var canSumit = true;
    var emailError = CustomFormValidation.errorMessageEmail(
      _emailController.text.trim(),
      'Email is required',
    );
    var passwordError = CustomFormValidation.errorMessagePassword(
      _passwordController.text.trim(),
      "Password is required",
    );
    if (emailError != '' || passwordError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight(context) * 0.085,
                  ),
                  SizedBox(
                    width: 174,
                    height: screenHeight(context) * 0.15,
                    child: SvgPicture.asset(AppAsset.logo),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Hello!',
                          color: AppColors.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                        BodyText('Login to your account'),
                        const Gap(20),
                        Align(
                          child: Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                              return SmallText(
                                provider.loginError,
                                color: AppColors.red,
                              );
                            },
                          ),
                        ),
                        const Gap(10),
                        StreamBuilder<String>(
                          stream: emailStreamController.stream,
                          builder: (context, snapshot) {
                            return InputTextField(
                              controller: _emailController,
                              label: 'Email',
                              focusNode: _emailFocus,
                              errorText: CustomFormValidation.errorMessageEmail(
                                snapshot.data,
                                'Email is required',
                              ),
                            );
                          },
                        ),
                        const Gap(20),
                        StreamBuilder<String>(
                          stream: passwordStreamController.stream,
                          builder: (context, snapshot) {
                            return InputTextField(
                              controller: _passwordController,
                              label: 'Password',
                              focusNode: _passwordFocus,
                              errorText:
                                  CustomFormValidation.errorMessagePassword(
                                snapshot.data,
                                "Password is required",
                              ),
                            );
                          },
                        ),
                        const Gap(5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SmallText(
                            'FORGOT PASSWORD?',
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const Gap(35),
                        ValueListenableBuilder<bool>(
                          valueListenable: _canSubmit,
                          builder: (context, canSubmit, child) {
                            return ExpandedButton(
                              text: 'Login',
                              borderRadius: 20,
                              disabled: !canSubmit,
                              busy: false,
                              onPressed: () async {
                                await sl<AuthProvider>().loginUser(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  context: context,
                                );
                              },
                            );
                          },
                        ),
                        const Gap(30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
