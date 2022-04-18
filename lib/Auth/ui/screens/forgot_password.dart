import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../uitls/app_colors.dart';
import '../../../uitls/app_fonts.dart';
import '../../../widgets/button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  FormGroup buildForm() => fb.group(<String, Object>{
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerForgotPassword(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _message(),
                ReactiveFormBuilder(
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
                        _buttonForgotPassword(form),
                        _back()
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _back() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(false),
      child: const Text(
        'Ingresar ao Aplicatico',
        style: TextStyle(fontFamily: AppFonts.light, color: AppColors.blue_dark),
      ),
    );
  }

  Widget _message() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: const Text(
        "Para recuperar sua senha será enviado um e-mail com uma senha provisoria.",
        textAlign: TextAlign.start,
        style: TextStyle(fontFamily: AppFonts.light, fontSize: 14),
        maxLines: 3,
      ),
    );
  }

  Widget _headerForgotPassword() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: 260,
        color: AppColors.blue,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Esqueciu sua senha?",
              style: TextStyle(
                  fontSize: 40, fontFamily: AppFonts.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonForgotPassword(form) {
    return Button(
      padding: const EdgeInsets.symmetric(vertical: 20),
      label: "Recuperar",
      onTab: () => {
        if (form.valid) {print(form.value)} else {form.markAllAsTouched()}
      },
    );
  }
}
