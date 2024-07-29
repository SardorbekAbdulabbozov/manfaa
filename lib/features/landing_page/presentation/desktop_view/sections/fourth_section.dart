import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaa/core/base_functions/base_functions.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> tableData = [
      LocaleKeys.beginner.tr(),
      LocaleKeys.pro.tr(),
      LocaleKeys.scoring.tr(),
      LocaleKeys.basic.tr(),
      LocaleKeys.gameBased.tr(),
      LocaleKeys.careerDirection.tr(),
      LocaleKeys.basic.tr(),
      LocaleKeys.detailedInsights.tr(),
      LocaleKeys.roadmapGeneration.tr(),
      LocaleKeys.limited.tr(),
      "∞",
      LocaleKeys.courseRecommendation.tr(),
      LocaleKeys.limited.tr(),
      "∞",
    ];

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
                LocaleKeys.costForInvesting.tr(),
                style: AppTextStyles.blackSize24Weight600,
              ),
            ),
            SizedBox(
              width: 2 * size.width / 3,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: tableData.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (size.width / 3) / ((size.height - 65) / 5),
                ),
                itemBuilder: (_, index) {
                  final row = BaseFunctions.calculateRowIndex(index, 3);
                  final column = BaseFunctions.calculateColumnIndex(index, 3);
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: row == 0 && column > 0
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        left: BorderSide(
                          color: column == 0 && row > 0
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        right: const BorderSide(),
                        bottom: const BorderSide(),
                      ),
                      color: BaseFunctions.paintTableRow(index, 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: column > 0
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          index == 0
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  width: (2 * size.width / 3) / 3 - 34,
                                  child: Text(
                                    tableData[index - 1],
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: row == 0 || column == 0
                                        ? AppTextStyles.blackSize16Weight600
                                        : AppTextStyles.blackSize14Weight500,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
