import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manfaa/components/widgets/action_button.dart';
import 'package:manfaa/components/widgets/universal_dialog.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/features/landing_page/bloc/landing_page_bloc.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/fifth_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/first_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/fourth_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/second_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/third_section.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key, this.currentSectionIndex = 0});

  final int currentSectionIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<LandingPageBloc>();
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {
        if (state.showRegisterSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return UniversalDialog(
                title: LocaleKeys.success.tr(),
                content: LocaleKeys.registerSuccessMessage.tr(),
                confirmButtonText: "OK",
                confirmButtonCallback: () {
                  context.pop();
                  bloc.add(const CloseRegisterSuccessDialog());
                },
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 64,
            title: Padding(
              padding: const EdgeInsets.only(left: 46, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 48),
                    child: GestureDetector(
                      onTap: () => bloc.add(const ChangeSection(index: 0)),
                      child: Image.asset(
                        'assets/images/logo.png',
                        scale: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ActionButton(
                    onPressed: () => bloc.add(const ChangeSection(index: 1)),
                    text: LocaleKeys.solution.tr(),
                    color: Colors.transparent,
                  ),
                  ActionButton(
                    onPressed: () => bloc.add(const ChangeSection(index: 2)),
                    text: LocaleKeys.results.tr(),
                    color: Colors.transparent,
                  ),
                  ActionButton(
                    onPressed: () => bloc.add(const ChangeSection(index: 3)),
                    text: LocaleKeys.pricing.tr(),
                    color: Colors.transparent,
                  ),
                  const Spacer(),
                  ActionButton(
                    onPressed: () => bloc.add(const ChangeSection(index: 4)),
                    overlayColor: Colors.white.withOpacity(0.2),
                    text: LocaleKeys.requestDemo.tr(),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(height: 0, color: AppColors.ededed),
            ),
          ),
          body: PageStorage(
            bucket: PageStorageBucket(),
            child: CarouselSlider(
              items: [
                FirstSection(
                  onTap: () => bloc.add(const ChangeSection(index: 4)),
                ),
                const SecondSection(),
                const ThirdSection(),
                const FourthSection(),
                FifthSection(
                  onSubmitted: (contactInformation) {
                    bloc.add(Submit2Waitlist(contactInformation));
                  },
                ),
              ],
              carouselController: state.carouselController,
              options: CarouselOptions(
                autoPlay: false,
                initialPage: state.currentSectionIndex,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                pageSnapping: false,
                aspectRatio: size.width / (size.height - 65),
                scrollDirection: Axis.vertical,
                scrollPhysics: const ClampingScrollPhysics(),
              ),
            ),
          ),
        );
      },
    );
  }
}
