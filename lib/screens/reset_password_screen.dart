import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/routes/app_page.dart';
import 'package:smis_mobile/widgets/button_widget.dart';
import 'package:smis_mobile/widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cfPasswordController = TextEditingController();
  final String? otp = Get.arguments['otp'];

  @override
  Widget build(BuildContext context) {
    final double kb = MediaQuery.of(
      context,
    ).viewInsets.bottom; // keyboard height ()
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text("Reset Password", style: AppTextStyles.heading),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // dynamic top space
                        SizedBox(height: kb > 0 ? 0 : 52),

                        // image
                        SizedBox(
                          width: 200,
                          height: 180,
                          child: Image.asset(
                            "${AppConstants.imagesPath}forgot_pass.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),

                        // Title
                        Text(
                          "Create new Password",
                          style: TextStyle(
                            fontSize: AppSizes.textLarge,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Please write yours new password",
                          style: TextStyle(fontSize: AppSizes.textMedium),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "your otp : $otp",
                          style: TextStyle(fontSize: AppSizes.textMedium),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        // new password input fields
                        TextFieldWidget(
                          icon: Icons.lock_outline,
                          hintText: "New Password",
                          keyboardType: TextInputType.visiblePassword,
                          valueController: _passwordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 10),

                        // cf password input fields
                        TextFieldWidget(
                          icon: Icons.lock_outline,
                          hintText: "Confrim password",
                          keyboardType: TextInputType.visiblePassword,
                          valueController: _cfPasswordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        Spacer(),

                        // confirm button
                        ButtonWidget(
                          onPressed: () {
                            // Handle confirm button press
                            print(_passwordController.text);
                            print(_cfPasswordController.text);

                            Get.offAllNamed(Routes.LOGIN_SCREEN);
                          },
                          child: Text("Confirm", style: AppTextStyles.button),
                        ),

                        SizedBox(height: 20),
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
