import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/common/constants/app_strings.dart';
import 'package:smart_home_security/common/widget/custom_snackbar.dart';
import 'package:smart_home_security/common/widget/text_fields/custom_text_field.dart';
import 'package:smart_home_security/features/auth_feature/domain/bloc/auth_bloc.dart';
import 'package:smart_home_security/features/auth_feature/widget/components/auth_button.dart';
import 'package:smart_home_security/features/auth_feature/widget/components/change_auth_type_button.dart';
import 'package:smart_home_security/features/auth_feature/widget/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              builder: (context) => const LoginPage(),
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
                AppStrings.registration,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  hintText: AppStrings.login,
                  onChanged: (value) => username = value,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField.password(
                  onChanged: (value) => password = value,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    title: AppStrings.register,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authBloc.add(
                          AuthEvent.register(
                            username: username!,
                            password: password!,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  ChangeAuthTypeButton(
                      title: AppStrings.haveAnAccount,
                      subTitle: AppStrings.comeIn,
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
