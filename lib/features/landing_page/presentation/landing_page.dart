import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manfaa/features/landing_page/bloc/landing_page_bloc.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/desktop_view.dart';
import 'package:manfaa/features/landing_page/presentation/mobile_view/mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = '/landing_page';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) {
        return MobileView(
          currentSectionIndex:
              context.read<LandingPageBloc>().state.currentSectionIndex,
        );
      },
      desktop: (context) {
        return DesktopView(
          currentSectionIndex:
              context.read<LandingPageBloc>().state.currentSectionIndex,
        );
      },
    );
  }
}
