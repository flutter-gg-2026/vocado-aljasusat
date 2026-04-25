import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vocado/core/theme/app_colors.dart';

class LoadingWidgetOverlay {
  OverlayEntry? _overlayEntry;

  // Singleton instance
  static final LoadingWidgetOverlay _instance =
      LoadingWidgetOverlay._internal();

  factory LoadingWidgetOverlay() {
    return _instance;
  }

  LoadingWidgetOverlay._internal();

  void show(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            color: AppColors.textMain.withAlpha(225),
            dismissible: false,
          ),
          Center(
            child: LoadingAnimationWidget.discreteCircle(
              // leftDotColor: const Color(0xFF1A1A3F),
              // rightDotColor: const Color(0xFFEA3799),
              secondRingColor: AppColors.textSecondary,
              thirdRingColor: AppColors.calendarSelection,
              color: AppColors.calendarSelection,
              size: 50,
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

//--

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 50});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: AppColors.accentAccent,
        size: 40,
      ),
    );
  }
}
