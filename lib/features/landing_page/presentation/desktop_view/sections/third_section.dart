import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';
import 'package:manfaa/features/landing_page/bloc/landing_page_bloc.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key, this.isMobileView = false, required this.bloc});

  final bool isMobileView;
  final LandingPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    final List<Result> results = [
      Result(
        title: LocaleKeys.infoResultOneTitle.tr(),
        description: LocaleKeys.infoResultOneDescription.tr(),
        iconImage: "📈",
      ),
      Result(
        title: LocaleKeys.infoResultTwoTitle.tr(),
        description: LocaleKeys.infoResultTwoDescription.tr(),
        iconImage: '🥵',
      ),
      Result(
        title: LocaleKeys.infoResultThreeTitle.tr(),
        description: LocaleKeys.infoResultThreeDescription.tr(),
        iconImage: '💸',
      ),
    ];
    final size = MediaQuery.of(context).size;
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: size.height - 65,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Text(
                LocaleKeys.resultYouWillSee.tr(),
                style: AppTextStyles.blackSize24Weight600,
              ),
            ),
            Visibility(
              visible: !isMobileView,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 182),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return ResultItem(
                      title: results[index].title,
                      description: results[index].description,
                      iconImage: results[index].iconImage,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 36),
                  itemCount: results.length,
                ),
              ),
            ),
            Visibility(
              visible: isMobileView,
              child: SizedBox(
                height: 200,
                width: size.width,
                child: CarouselSlider.builder(
                  itemCount: results.length,
                  itemBuilder: (_, index, __) {
                    return ResultItem(
                      isMobileView: isMobileView,
                      title: results[index].title,
                      description: results[index].description,
                      iconImage: results[index].iconImage,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Result {
  const Result({
    required this.title,
    required this.description,
    required this.iconImage,
  });

  final String title;
  final String description;
  final String iconImage;
}

class ResultItem extends StatelessWidget {
  const ResultItem({
    super.key,
    this.scale,
    required this.title,
    required this.description,
    required this.iconImage,
    this.isMobileView = false,
  });

  final bool isMobileView;
  final String title;
  final String description;
  final String iconImage;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isMobileView ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(title, style: AppTextStyles.blackSize16Weight600),
                ),
                Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.f2a33a,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(child: Text(iconImage)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: isMobileView ? ((2 * size.width) / 3 - 32) : size.width / 4,
            child: Text(
              description,
              style: AppTextStyles.blackSize14Weight500,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
