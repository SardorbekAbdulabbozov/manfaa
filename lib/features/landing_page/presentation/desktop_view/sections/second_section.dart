import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key, this.isMobileView = false});

  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    final List<Solution> solutions = [
      Solution(
        title: LocaleKeys.infoSolutionOneTitle.tr(),
        description: LocaleKeys.infoSolutionOneDescription.tr(),
        image: 'assets/images/section1.png',
      ),
      Solution(
        title: LocaleKeys.infoSolutionTwoTitle.tr(),
        description: LocaleKeys.infoSolutionTwoDescription.tr(),
        image: 'assets/images/section2.png',
      ),
      Solution(
        title: LocaleKeys.infoSolutionThreeTitle.tr(),
        description: LocaleKeys.infoSolutionThreeDescription.tr(),
        image: 'assets/images/section3.png',
      ),
    ];

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              LocaleKeys.solutionTitle.tr(),
              style: AppTextStyles.blackSize24Weight600,
            ),
          ),
          Visibility(
            visible: !isMobileView,
            child: Center(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return SolutionItem(
                    index: index + 1,
                    isMobileView: isMobileView,
                    title: solutions[index].title,
                    description: solutions[index].description,
                    image: solutions[index].image,
                  );
                },
                separatorBuilder: (_, index) => SizedBox(
                  height: isMobileView ? 0 : 36,
                  width: isMobileView ? 36 : 0,
                ),
                itemCount: solutions.length,
              ),
            ),
          ),
          Visibility(
            visible: isMobileView,
            child: CarouselSlider.builder(
              itemCount: solutions.length,
              itemBuilder: (_, index, __) {
                return SolutionItem(
                  index: index + 1,
                  isMobileView: isMobileView,
                  title: solutions[index].title,
                  description: solutions[index].description,
                  image: solutions[index].image,
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
        ],
      ),
    );
  }
}

class Solution {
  const Solution({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

class SolutionItem extends StatelessWidget {
  const SolutionItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.index,
    this.isMobileView = false,
  });

  final int index;
  final String title;
  final String description;
  final String image;
  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final children = [
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            margin:
                isMobileView ? const EdgeInsets.only(top: 16) : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.f2a33a,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                "$index",
                style: AppTextStyles.blackSize16Weight500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title, style: AppTextStyles.blackSize16Weight600),
          ),
          SizedBox(
            width: isMobileView ? ((2 * size.width) / 3 - 32) : size.width / 4,
            child: Text(
              description,
              style: AppTextStyles.blackSize14Weight500,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      Visibility(
        visible: size.width > 680,
        child: Container(
          width: isMobileView ? null : 250,
          decoration: isMobileView
              ? null
              : BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
          height: 175,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ];
    return isMobileView
        ? Container(
            width: (2 * size.width) / 3,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children.reversed.toList(),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          );
  }
}
