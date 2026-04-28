import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/widgets/button_widget.dart';

class GetOtpScreen extends StatefulWidget {
  const GetOtpScreen({super.key});

  @override
  State<GetOtpScreen> createState() => _GetOtpScreenState();
}

class _GetOtpScreenState extends State<GetOtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  ); // ✅ focus for each field

  @override
  void initState() {
    super.initState();

    // Add listeners for auto-select on focus
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus && _controllers[i].text.isNotEmpty) {
          _controllers[i].selection = TextSelection(
            baseOffset: 0,
            extentOffset: _controllers[i].text.length,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String getOtp() {
    return _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final double kb = MediaQuery.of(
      context,
    ).viewInsets.bottom; // keyboard height ()
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ button moves up with keyboard
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
                        width: 280,
                        height: 180,
                        child: Image.asset(
                          "${AppConstants.imagesPath}login_image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Title
                      Text(
                        "Enter the OTP",
                        style: TextStyle(
                          fontSize: AppSizes.textLarge,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "OTP code sent to your SMS",
                        style: TextStyle(fontSize: AppSizes.textMedium),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),

                      // OTP input fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          6,
                          (index) => SizedBox(
                            width: 45,
                            height: 45,
                            child: TextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              autofocus: false, // ✅ no auto keyboard
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: index < 5
                                  ? TextInputAction.next
                                  : TextInputAction.done,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(bottom: 15),
                              ),
                              onTap: () {
                                _controllers[index].clear();
                              },
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(_focusNodes[index + 1]);
                                }
                                if (value.isEmpty && index > 0) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(_focusNodes[index - 1]);
                                }
                              },
                              onSubmitted: (_) {
                                // ✅ This runs even if user types same number again
                                if (index < 5) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(_focusNodes[index + 1]);
                                } else {
                                  FocusScope.of(
                                    context,
                                  ).unfocus(); // close keyboard on last field
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      /// Resend Code
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't receive code? ",
                            style: TextStyle(fontSize: AppSizes.textMedium),
                          ),
                          GestureDetector(
                            onTap: () {
                              debugPrint("Resend code tapped");
                            },
                            child: Text(
                              "SEND NEW CODE",
                              style: TextStyle(
                                color: AppColors.textVariantPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.textMedium,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Spacer(),

                      //btn confirm
                      ButtonWidget(
                        child: Text("Confrim", style: AppTextStyles.button),
                        onPressed: () {
                          // Get the entered OTP
                          String otp = getOtp();
                          debugPrint("Entered OTP: $otp");
                        },
                      ),
                      // Confirm button
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
