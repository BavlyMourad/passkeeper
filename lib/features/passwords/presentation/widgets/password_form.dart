import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/providers/obscure_text.dart';
import 'package:passkeeper/core/validators/app_form_validators.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/category_select_field.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/category_view_field.dart';

class PasswordForm extends ConsumerStatefulWidget {
  const PasswordForm({
    super.key,
    this.password,
    this.isReadOnly = false,
    required this.onSubmit,
  });

  final Password? password;
  final bool isReadOnly;
  final void Function(Password password) onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordDetailsFormState();
}

class _PasswordDetailsFormState extends ConsumerState<PasswordForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> _selectedCategoryIds = [];

  @override
  void initState() {
    super.initState();

    // if editing, pre-fill. if adding, controllers start empty
    _titleController.text = widget.password?.title ?? '';
    _usernameController.text = widget.password?.username ?? '';
    _passwordController.text = widget.password?.encryptedPassword ?? '';
    _confirmPasswordController.text = widget.password?.encryptedPassword ?? '';
    _websiteController.text = widget.password?.url ?? '';
    _selectedCategoryIds = [...?widget.password?.categoryIds];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _websiteController.dispose();

    super.dispose();
  }

  void _toggleObscureText(String key) {
    ref.read(obscureTextProvider(key).notifier).toggle();
  }

  @override
  Widget build(BuildContext context) {
    final isPasswordObscured = ref.watch(
      obscureTextProvider(ObscureTextKeys.password),
    );
    final isConfirmPasswordObscured = ref.watch(
      obscureTextProvider(ObscureTextKeys.confirmPassword),
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Title Field
          AppTextField(
            controller: _titleController,
            readOnly: widget.isReadOnly,
            validator: (value) => AppFormValidators.required(context, value),
            prefixIconPath: IconPaths.service,
            labelText: AppLocalizations.of(context)!.titleHint,
          ),

          const SizedBox(height: 24.0),

          // Email/Username Field
          AppTextField(
            controller: _usernameController,
            readOnly: widget.isReadOnly,
            isOptional: true,
            keyboardType: TextInputType.emailAddress,
            prefixIconPath: IconPaths.username,
            labelText: AppLocalizations.of(context)!.usernameHint,
          ),

          const SizedBox(height: 24.0),

          // Password Field
          AppTextField(
            controller: _passwordController,
            readOnly: widget.isReadOnly,
            obscureText: isPasswordObscured,
            validator: (value) => AppFormValidators.required(context, value),
            prefixIconPath: IconPaths.password,
            suffixIconPath: isPasswordObscured
                ? IconPaths.invisible
                : IconPaths.visible,
            onSuffixIconPressed: () =>
                _toggleObscureText(ObscureTextKeys.password),
            secondarySuffixIconPath: IconPaths.copy,
            onSecondarySuffixIconPressed: () {},
            labelText: AppLocalizations.of(context)!.passwordHint,
          ),

          const SizedBox(height: 24.0),

          // Confirm Password Field
          if (!widget.isReadOnly) ...[
            AppTextField(
              controller: _confirmPasswordController,
              readOnly: widget.isReadOnly,
              obscureText: isConfirmPasswordObscured,
              validator: (value) => AppFormValidators.confirmPassword(
                context,
                value,
                _passwordController.text,
              ),
              prefixIconPath: IconPaths.password,
              suffixIconPath: isConfirmPasswordObscured
                  ? IconPaths.invisible
                  : IconPaths.visible,
              onSuffixIconPressed: () =>
                  _toggleObscureText(ObscureTextKeys.confirmPassword),
              secondarySuffixIconPath: IconPaths.copy,
              onSecondarySuffixIconPressed: () {},
              labelText: AppLocalizations.of(context)!.confirmPasswordHint,
            ),

            const SizedBox(height: 24.0),
          ],

          if (widget.isReadOnly) ...[
            // Category View Field
            CategoryViewField(categoryIds: widget.password!.categoryIds),

            const SizedBox(height: 24.0),
          ],

          if (!widget.isReadOnly) ...[
            CategorySelectField(
              selectedCategoryIds: _selectedCategoryIds,
              onCategorySelected: (id) {
                setState(() {
                  if (!_selectedCategoryIds.contains(id)) {
                    _selectedCategoryIds.add(id);
                  }
                });
              },
              onCategoryRemoved: (id) {
                setState(() {
                  _selectedCategoryIds.remove(id);
                });
              },
              onAddNewCategory: () {},
            ),

            const SizedBox(height: 24.0),
          ],

          // Website Field
          AppTextField(
            controller: _websiteController,
            readOnly: widget.isReadOnly,
            prefixIconPath: IconPaths.link,
            isOptional: true,
            labelText: AppLocalizations.of(context)!.websiteHint,
          ),

          if (!widget.isReadOnly) ...[
            const SizedBox(height: 32.0),

            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final updated =
                      (widget.password ??
                              Password(
                                id: '1239',
                                title: '',
                                encryptedPassword: '',
                                categoryIds: _selectedCategoryIds,
                                isFavourite: false,
                                createdAt: DateTime.now(),
                                updatedAt: DateTime.now(),
                                iv: '',
                              ))
                          .copyWith(
                            title: _titleController.text.trim(),
                            username: _usernameController.text.trim().isEmpty
                                ? null
                                : _usernameController.text.trim(),
                            encryptedPassword: _passwordController.text.trim(),
                            url: _websiteController.text.trim().isEmpty
                                ? null
                                : _websiteController.text.trim(),
                            categoryIds: _selectedCategoryIds,
                            updatedAt: DateTime.now(),
                          );
                  widget.onSubmit(updated);
                }
              },
              prefixIconPath: IconPaths.save,
              title: widget.password != null
                  ? AppLocalizations.of(context)!.saveChanges
                  : AppLocalizations.of(context)!.addPassword,
            ),
          ],
        ],
      ),
    );
  }
}
