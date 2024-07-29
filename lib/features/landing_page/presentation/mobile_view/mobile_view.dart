import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manfaa/components/global_variables.dart';
import 'package:manfaa/components/widgets/action_button.dart';
import 'package:manfaa/components/widgets/universal_dialog.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';
import 'package:manfaa/features/landing_page/bloc/landing_page_bloc.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/fifth_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/first_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/fourth_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/second_section.dart';
import 'package:manfaa/features/landing_page/presentation/desktop_view/sections/third_section.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key, this.currentSectionIndex = 0});

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
            title: Image.asset(
              'assets/images/logo.png',
              scale: 30,
              fit: BoxFit.cover,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                height: 0,
                color: AppColors.ededed,
              ),
            ),
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 46).copyWith(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: GestureDetector(
                      onTap: () =>
                          bloc.add(ChangeSection(index: 0, onPop: context.pop)),
                      child: Image.asset(
                        'assets/images/logo.png',
                        scale: 40,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ActionButton(
                    onPressed: () =>
                        bloc.add(ChangeSection(index: 1, onPop: context.pop)),
                    text: LocaleKeys.solution.tr(),
                    textStyle: AppTextStyles.blackSize22Weight600,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ActionButton(
                      onPressed: () =>
                          bloc.add(ChangeSection(index: 2, onPop: context.pop)),
                      text: LocaleKeys.results.tr(),
                      textStyle: AppTextStyles.blackSize22Weight600,
                      color: Colors.transparent,
                    ),
                  ),
                  ActionButton(
                    onPressed: () =>
                        bloc.add(ChangeSection(index: 3, onPop: context.pop)),
                    text: LocaleKeys.pricing.tr(),
                    textStyle: AppTextStyles.blackSize22Weight600,
                    color: Colors.transparent,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 16),
                    child: Material(
                      color: AppColors.f5f5f5,
                      borderRadius: BorderRadius.circular(8),
                      child: DropdownButton<String>(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        value: state.locale,
                        items: const [
                          DropdownMenuItem(
                            value: "uz",
                            child: Text("O'zbek"),
                          ),
                          DropdownMenuItem(
                            value: "en",
                            child: Text("English"),
                          ),
                          DropdownMenuItem(
                            value: "ru",
                            child: Text("Русский"),
                          ),
                        ],
                        onChanged: (locale) async {
                          if (locale != null) {
                            bloc.add(ChangeLocale(locale));
                            await context.setLocale(Locale(locale));
                            await storageService.setLocale(locale);
                          }
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        style: AppTextStyles.blackSize16Weight600,
                        underline: const SizedBox.shrink(),
                        focusColor: Colors.transparent,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: ActionButton(
                      onPressed: () =>
                          bloc.add(ChangeSection(index: 4, onPop: context.pop)),
                      overlayColor: Colors.white.withOpacity(0.2),
                      text: LocaleKeys.requestDemo.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: PageStorage(
            bucket: PageStorageBucket(),
            child: CarouselSlider(
              items: [
                FirstSection(
                  onTap: () => bloc.add(const ChangeSection(index: 4)),
                  isMobileView: true,
                ),
                SecondSection(isMobileView: true, bloc: bloc),
                ThirdSection(isMobileView: true, bloc: bloc),
                FourthSection(bloc: bloc),
                FifthSection(
                  isMobileView: true,
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
