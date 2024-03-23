import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/common/constants/app_strings.dart';
import 'package:smart_home_security/common/widget/custom_snackbar.dart';
import 'package:smart_home_security/common/widget/text_fields/custom_text_field.dart';
import 'package:smart_home_security/features/auth_feature/domain/bloc/auth_bloc.dart';
import 'package:smart_home_security/features/auth_feature/widget/components/auth_button.dart';
import 'package:smart_home_security/features/auth_feature/widget/components/change_auth_type_button.dart';
import 'package:smart_home_security/features/auth_feature/widget/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  String? username;

  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.mapOrNull(
        successful: (state) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          );
          CustomSnackBar.showSuccessful(context, message: state.message);
        },
        error: (state) =>
            CustomSnackBar.showError(context, message: state.message),
      ),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                AppStrings.authorization,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  hintText: AppStrings.login,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterSomething;
                    }
                    username = value;
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField.password(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterSomething;
                    }
                    password = value;
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: AppStrings.comeIn,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authBloc.add(
                      AuthEvent.login(
                        username: username!,
                        password: password!,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              ChangeAuthTypeButton(
                title: AppStrings.dontHaveAnAccount,
                subTitle: AppStrings.register,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
