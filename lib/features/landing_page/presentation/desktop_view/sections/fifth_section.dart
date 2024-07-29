import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manfaa/components/widgets/action_button.dart';
import 'package:manfaa/core/config/localization/locale_keys.g.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({
    super.key,
    this.isMobileView = false,
    required this.onSubmitted,
  });

  final bool isMobileView;
  final void Function(String) onSubmitted;

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection> {
  String contactInformation = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.isMobileView
                        ? LocaleKeys.motivationalText.tr().replaceAll("\n", "")
                        : LocaleKeys.motivationalText.tr(),
                    style: AppTextStyles.blackSize24Weight600,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36, bottom: 16),
                  child: SizedBox(
                    width: (size.width) / 3,
                    child: TextField(
                      cursorColor: Colors.black,
                      onChanged: (value) => contactInformation = value,
                      controller: controller,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.f2a33a),
                        ),
                        hintText: LocaleKeys.emailOrPhone.tr(),
                      ),
                    ),
                  ),
                ),
                ActionButton(
                  text: LocaleKeys.submit.tr(),
                  onPressed: () {
                    widget.onSubmitted.call(contactInformation.trim());
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Divider(height: 0, color: AppColors.ededed),
          Container(
            width: size.width,
            height: 64,
            color: AppColors.f0c271,
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              children: [
                Text(
                  "${LocaleKeys.allRightsReserved.tr()}, ${DateTime.now().year}",
                  style: AppTextStyles.blackSize14Weight500,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'manfaa.info@uz',
                    );
                    await launchUrl(emailLaunchUri);
                  },
                  icon: const Icon(
                    Icons.mail_rounded,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: IconButton(
                    onPressed: () async {
                      html.window.open(
                        'https://t.me/sardorbek_abdulabbozov',
                        "_blank",
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/vectors/telegram.svg',
                      height: 22,
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    html.window.open(
                      'https://www.linkedin.com/in/sardorbek-abdulabbozov/',
                      "_blank",
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/vectors/linkedin.svg',
                    height: 24,
                    width: 14,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
