import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smis_mobile/controllers/auth_controller.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/screens/activate_account_screen.dart';
import 'package:smis_mobile/widgets/button_widget.dart';
import 'package:smis_mobile/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentIdController = TextEditingController();
    final passwordController = TextEditingController();
    final auth = Get.find<AuthController>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),

                        // image
                        SizedBox(
                          width: (MediaQuery.of(context).size.width >= 600)
                              ? 450
                              : 280,
                          height: (MediaQuery.of(context).size.width >= 600)
                              ? 350
                              : 180,
                          child: Image.asset(
                            "${AppConstants.imagesPath}login_image.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // title
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "NunitoSans",
                          ),
                        ),

                        // message display
                        Obx(
                          () => auth.message.value.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    auth.message.value,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),

                        const SizedBox(height: 20),

                        // student ID
                        TextFieldWidget(
                          icon: Icons.person_outlined,
                          hintText: "Student ID",
                          // keyboardType: TextInputType.number,
                          valueController: studentIdController,
                        ),

                        const SizedBox(height: 10),

                        // password
                        TextFieldWidget(
                          icon: Icons.lock_outline_rounded,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          valueController: passwordController,
                          obscureText: true,
                        ),

                        const SizedBox(height: 10),

                        // Remember me + Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     Obx(
                            //       () => Checkbox(
                            //         value: auth.rememberMe.value,
                            //         onChanged: (v) =>
                            //             auth.rememberMe.value = v!,
                            //         activeColor: AppColors.textAccent,
                            //         checkColor: AppColors.background,
                            //         side: const BorderSide(
                            //           color: AppColors.textSecondary,
                            //           width: 1.5,
                            //         ),
                            //         materialTapTargetSize:
                            //             MaterialTapTargetSize.shrinkWrap,
                            //         visualDensity: const VisualDensity(
                            //           horizontal: -2,
                            //           vertical: -4,
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(width: 5),
                            //     Text(
                            //       "Remember me",
                            //       style: TextStyle(
                            //         fontSize: 11,
                            //         color: AppColors.textSecondary,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            InkWell(
                              onTap: () {
                                auth.rememberMe.toggle(); // toggle RxBool
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: auth.rememberMe.value,
                                      onChanged: (v) {
                                        auth.rememberMe.value = v!;
                                      },
                                      activeColor: AppColors.textAccent,
                                      checkColor: AppColors.background,
                                      side: const BorderSide(
                                        color: AppColors.textSecondary,
                                        width: 1.5,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: const VisualDensity(
                                        horizontal: -2,
                                        vertical: -4,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Get.toNamed('/forgot-password-screen');
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: AppColors.textAccent,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),

                        if (MediaQuery.of(context).size.width >= 600)
                          // Spacer()
                          SizedBox(height: 50)
                        else
                          SizedBox(height: 40),

                        // Sign in button
                        ButtonWidget(
                          onPressed: () {
                            auth.signin(
                              studentIdController.text,
                              passwordController.text,
                            );
                          },
                          child: Obx(
                            () => auth.loading.value
                                ? SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(
                                      color: AppColors.background,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text("Sign in", style: AppTextStyles.button),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Activate button
                        ButtonWidget(
                          isOutlined: true,
                          backgroundColor: AppColors.secondary,
                          child: Text(
                            "Activate account by student ID",
                            style: AppTextStyles.button_outline,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ActivateAccountScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // OR line
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.textSecondary,
                                thickness: 1,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.textSecondary,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Sign in as Guest
                        ButtonWidget(
                          child: Text(
                            "Sign in as Guest",
                            style: AppTextStyles.button,
                          ),
                          onPressed: () {
                            print("guest pressed");
                          },
                        ),

                        const SizedBox(height: AppSizes.paddingMedium),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
