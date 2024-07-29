import 'package:flutter/material.dart';
import 'package:manfaa/core/theme/colors/app_colors.dart';
import 'package:manfaa/core/theme/text_styles/app_text_styles.dart';

class UniversalDialog extends StatelessWidget {
  const UniversalDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonText,
    required this.confirmButtonCallback,
  });

  final String title;
  final String content;
  final String confirmButtonText;
  final VoidCallback confirmButtonCallback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: size.width / 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 4, top: 24),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.blackSize16Weight600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                content,
                style: AppTextStyles.blackSize14Weight400,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: 16, bottom: 24),
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.f0c271,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: confirmButtonCallback,
                  child: Center(
                    child: Text(
                      confirmButtonText,
                      style: AppTextStyles.blackSize16Weight600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
