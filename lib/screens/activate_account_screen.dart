import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/screens/get_otp_screen.dart';
import 'package:smis_mobile/widgets/button_widget.dart';
import 'package:smis_mobile/widgets/text_field_two_widget.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({super.key});

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController schoolEmailController = TextEditingController();
  final TextEditingController personalEmailCotroller = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  Future<void> activateAccount() async {
    // String lastName = lastNameController.text.trim();
    // String firstName = firstNameController.text.trim();
    // String schoolEmail = schoolEmailController.text.trim();
    // String personalEmail = personalEmailCotroller.text.trim();
    // String studentId = studentIdController.text.trim();

    // Add your activation logic here

    // Navigate to another VerifyAccountScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetOtpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text("Activate Account", style: AppTextStyles.heading),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 52,
          left: AppSizes.paddingMedium,
          right: AppSizes.paddingMedium,
        ),
        child: Center(
          child: Column(
            children: [
              //image
              SizedBox(
                width: 280,
                height: 180,
                child: Image.asset(
                  "${AppConstants.imagesPath}login_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              //content title
              SizedBox(
                width: 250,
                child: Text(
                  "To activate your account Please fill your information",
                  style: TextStyle(fontSize: AppSizes.textMedium),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedBox(height: 20),

              //txt first&last name
              TextFieldTwoWidget(
                hintText_1: "Last name",
                valueController_1: lastNameController,
                hintText_2: "First name",
                valueController_2: firstNameController,
              ),
              SizedBox(height: 10),

              //txt school&personal email
              TextFieldTwoWidget(
                hintText_1: "School Email",
                valueController_1: schoolEmailController,
                keyboardType_1: TextInputType.emailAddress,
                hintText_2: "Personal Email",
                valueController_2: personalEmailCotroller,
                keyboardType_2: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),

              //txt Student ID
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                  border: Border.all(color: AppColors.secondary, width: 1.2),
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    // controller: studentIdController,
                    style: const TextStyle(fontSize: AppSizes.textLarge),
                    decoration: const InputDecoration(
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ),
                      hintText: "Student ID",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: AppSizes.textMedium,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //btn confirm
              ButtonWidget(
                child: Text("Confirm", style: AppTextStyles.button),
                onPressed: () {
                  activateAccount();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
