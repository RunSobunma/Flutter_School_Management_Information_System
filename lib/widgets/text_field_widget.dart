import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.icon,
    required this.hintText,
    required this.valueController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  final IconData icon;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController valueController;
  final bool obscureText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText; // start with given obscureText
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: AppColors.textSecondary, width: 1.2),
      ),
      child: TextField(
        obscureText: _obscure,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        controller: widget.valueController,
        style: const TextStyle(
          fontSize: AppSizes.textLarge,
          color: AppColors.textDarkGrey,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 5),
            child: Icon(widget.icon, color: AppColors.textSecondary, size: 25),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 36,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.textMedium,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.only(right: 5),

          // 👁 show eye icon only if it's a password field
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

// // Normal text field
// TextFieldWidget(
//   icon: Icons.email,
//   hintText: "Enter your email",
//   valueController: emailController,
// ),

// // Password field with 👁 toggle
// TextFieldWidget(
//   icon: Icons.lock,
//   hintText: "Enter your password",
//   valueController: passwordController,
//   obscureText: true,
// ),
