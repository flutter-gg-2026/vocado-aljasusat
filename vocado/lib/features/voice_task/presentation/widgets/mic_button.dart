import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/theme/app_colors.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.sw,
      height: 30.h,
      decoration:  BoxDecoration(
        shape: .circle,
        gradient: LinearGradient(
          colors: AppColors.uiUxGradient,
        ),
      ),
      child:  Icon(Icons.mic, color: Colors.black, size: 50),
    );
  }
}