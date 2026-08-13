import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_language_notifier.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';

class LanguageSegmentedButton extends ConsumerWidget {
  const LanguageSegmentedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);

    return SegmentedButton<AppLanguage>(
      showSelectedIcon: true,
      segments: [
        ButtonSegment(
          value: AppLanguage.en,
          label: Text(
            'EN',
            style: AppStyles.captionSemiBold(context).copyWith(
              color: language == AppLanguage.en
                  ? Theme.of(context).colorScheme.segmentedButtonSelectedText
                  : Theme.of(context).colorScheme.segmentedButtonUnselectedText,
            ),
          ),
        ),
        ButtonSegment(
          value: AppLanguage.ar,
          label: Text(
            'AR',
            style: AppStyles.captionSemiBold(context).copyWith(
              color: language == AppLanguage.ar
                  ? Theme.of(context).colorScheme.segmentedButtonSelectedText
                  : Theme.of(context).colorScheme.segmentedButtonUnselectedText,
            ),
          ),
        ),
      ],
      selected: {language},
      onSelectionChanged: (selection) {
        ref.read(appLanguageProvider.notifier).setLanguage(selection.first);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Theme.of(
              context,
            ).colorScheme.segmentedButtonSelectedBackground;
          }
          return Theme.of(
            context,
          ).colorScheme.segmentedButtonUnselectedBackground;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Theme.of(context).colorScheme.segmentedButtonSelectedText;
          }

          return Theme.of(context).colorScheme.segmentedButtonUnselectedText;
        }),
      ),
    );
  }
}
