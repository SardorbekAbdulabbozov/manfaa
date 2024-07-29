import 'package:flutter/material.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/desktop_view.dart';
import 'package:manfaa/features/landing_page/presentation/mobile_view/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const MobileView(),
      desktop: (context) => const DesktopView(),
    );
  }
}
