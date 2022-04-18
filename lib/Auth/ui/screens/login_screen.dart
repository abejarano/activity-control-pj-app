import 'package:activity_control_pj_app/uitls/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../uitls/app_colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/line.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  FormGroup buildForm() => fb.group(<String, Object>{
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': ['', Validators.required, Validators.minLength(8)],
        'rememberMe': false,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerLogin(),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            child: ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return Column(
                  children: [
                    ReactiveTextField<String>(
                      style: const TextStyle(fontFamily: AppFonts.regular),
                      formControlName: 'email',
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            'The email must not be empty',
                        ValidationMessage.email:
                            'The email value must be a valid email',
                        'unique': 'This email is already in use',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ReactiveTextField<String>(
                      style: const TextStyle(fontFamily: AppFonts.regular),
                      formControlName: 'password',
                      obscureText: true,
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            'The password must not be empty',
                        ValidationMessage.minLength:
                            'The password must be at least 8 characters',
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    _forgotPassword(),
                    const SizedBox(height: 16.0),
                    _buttonLogin(form),
                    const Line(
                      width: 300,
                      top: 30,
                      color: Colors.black12,
                    ),
                    _register()
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _register() {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ainda nāo tem uma conta?",
              style: TextStyle(fontFamily: AppFonts.regular),
            ),
            GestureDetector(
              onTap: () => {},
              child: const Text(
                " Cadastrate",
                style: TextStyle(
                    fontFamily: AppFonts.regular, color: AppColors.blue_dark),
              ),
            ),
          ],
        ));
  }

  Widget _forgotPassword() {
    return Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgotPassword()),
          ),
          child: const Text("Esqueceu sua senha?",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: AppColors.blue_dark, fontFamily: AppFonts.light)),
        ));
  }

  Widget _headerLogin() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: 180,
        color: AppColors.blue,
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 40, fontFamily: AppFonts.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin(form) {
    return Button(
      padding: const EdgeInsets.symmetric(vertical: 20),
      label: "Ingresar",
      onTab: () => {
        if (form.valid) {print(form.value)} else {form.markAllAsTouched()}
      },
    );
  }
}
