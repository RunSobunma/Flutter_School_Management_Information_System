import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/routes/app_page.dart';
import 'package:smis_mobile/widgets/button_widget.dart';
import 'package:smis_mobile/widgets/text_field_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double kb = MediaQuery.of(
      context,
    ).viewInsets.bottom; // keyboard height ()
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text("Get OTP Code", style: AppTextStyles.heading),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
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
                      SizedBox(height: 40),

                      // Title
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: AppSizes.textLarge,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "It is long established fact that a reader will be distracted by the readable content",
                        style: TextStyle(fontSize: AppSizes.textMedium),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),

                      // phone number input fields
                      TextFieldWidget(
                        icon: Icons.phone,
                        hintText: "Enter your phone number",
                        valueController: phoneNumberController,
                      ),

                      SizedBox(height: 10),
                      Spacer(),

                      // confirm button
                      ButtonWidget(
                        onPressed: () {
                          // Handle confirm button press
                          Get.toNamed(Routes.VERIFICATION_CONDE_SCREEN);
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
    );
  }
}
