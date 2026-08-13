import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/providers/biometric_auth.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class SettingsSecuritySection extends ConsumerWidget {
  const SettingsSecuritySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.security,
          style: AppStyles.titleSmallSemiBold(context),
        ),
        const SizedBox(height: 24.0),
        Card(
          margin: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0.0,
                  ),
                  leading: AppIcon(
                    path: IconPaths.fingerprint,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.biometricLogin,
                    style: AppStyles.bodyRegular(context),
                  ),
                  trailing: Switch(
                    value: ref.watch(biometricAuthProvider),
                    onChanged: (_) async {
                      final success = await ref
                          .read(biometricAuthProvider.notifier)
                          .toggle();

                      if (!success && context.mounted) {
                        AppUtils.showSnackBar(
                          context: context,
                          message: AppLocalizations.of(
                            context,
                          )!.biometricNotAvailable,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
