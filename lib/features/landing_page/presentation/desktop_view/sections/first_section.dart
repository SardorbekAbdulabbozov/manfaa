import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaa/components/widgets/action_button.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
    required this.onTap,
    this.isMobileView = false,
  });

  final bool isMobileView;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.mainInfo.tr(),
            style: isMobileView
                ? AppTextStyles.blackSize24Weight600
                : AppTextStyles.blackSize36Weight600,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36),
            child: Text(
              LocaleKeys.mainDescription.tr(),
              style: isMobileView
                  ? AppTextStyles.blackSize16Weight400
                  : AppTextStyles.blackSize22Weight400,
              textAlign: TextAlign.center,
            ),
          ),
          ActionButton(
            onPressed: onTap,
            overlayColor: Colors.white.withOpacity(0.2),
            text: LocaleKeys.joinTheWaitlist.tr(),
          ),
        ],
      ),
    );
  }
}
