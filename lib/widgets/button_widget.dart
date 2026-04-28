import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final bool isOutlined;

  const ButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 45,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.textWhite,
    this.borderRadius = AppSizes.radiusCircular,
    this.isOutlined = false, // default: filled
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: isOutlined
          ? BorderSide(color: backgroundColor, width: 1)
          : BorderSide.none,
    );

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus(); // dismiss keyboard
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : backgroundColor,
          foregroundColor: textColor,
          shadowColor: Colors.transparent, // avoid weird shadow with outline
          shape: shape,
          elevation: isOutlined ? 0 : 2,
        ),
        child: child,
      ),
    );
  }
}



/*
🔧 Usage
Filled button (default)
ConfirmButton(
  onPressed: () {},
  child: Text("Confirm", style: TextStyle(color: Colors.white)),
),

Outlined button
ConfirmButton(
  onPressed: () {},
  isOutlined: true,
  backgroundColor: Colors.red, // border + text color
  textColor: Colors.red,
  child: Text("Cancel"),
),

Outlined with icon
ConfirmButton(
  onPressed: () {},
  isOutlined: true,
  backgroundColor: Colors.blue,
  textColor: Colors.blue,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.phone, size: 16, color: Colors.blue),
      SizedBox(width: 6),
      Text("Call", style: TextStyle(color: Colors.blue)),
    ],
  ),
), 
*/