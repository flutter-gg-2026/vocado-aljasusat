import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/theme/app_colors.dart';
import 'package:vocado/core/widgets/bg_container.dart';

class SplashFeatureScreen extends StatelessWidget {
  const SplashFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgContainer(
        child: Column(
          spacing: 30,
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: AnyImageView(imagePath: 'assets/images/bg.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: .centerStart,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: AppColors.textMain, fontSize: 45),
                    children: <TextSpan>[
                      TextSpan(text: 'Transform\nyour '),
                      TextSpan(
                        text: 'voice',
                        style: TextStyle(fontWeight: .bold),
                      ),
                      TextSpan(text: ' into productive '),
                      TextSpan(
                        text: 'action.',
                        style: TextStyle(fontWeight: .bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.go(Routes.auth);
              },
              child: GlassContainer.frostedGlass(
                height: 10.h,
                width: 20.sw,
                shape: .circle,
                child: Icon(
                  Icons.arrow_forward,
                  size: 40,
                  color: AppColors.accentAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
