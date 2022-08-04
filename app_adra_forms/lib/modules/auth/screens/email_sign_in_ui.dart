import 'package:app_adra_forms/layout/componets/validators.dart';
import 'package:app_adra_forms/layout/spaces/form_vertical_spacing.dart';
import 'package:app_adra_forms/layout/widgets/buttons/label_button.dart';
import 'package:app_adra_forms/layout/widgets/buttons/primary_button.dart';
import 'package:app_adra_forms/layout/widgets/forms/form_input_field_with_icon.dart';
import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:app_adra_forms/modules/auth/screens/email_sign_up_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSignInUi extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EmailSignInUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    radius: 120.0,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/flutteracademy-logo.png",
                        fit: BoxFit.cover,
                        height: 240,
                        width: 240,
                      ),
                    ),
                  ),
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.emailController.text = value!,
                    labelText: 'Email',
                    validator: Validator().email,
                    minLines: 1,
                    obscureText: false,
                  ),
                  const FormVerticalSpacing(),
                  FormInputFieldWithIcon(
                    controller: authController.passwordController,
                    iconPrefix: Icons.lock,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.passwordController.text = value!,
                    labelText: 'Password',
                    validator: Validator().password,
                    minLines: 1,
                    maxLines: 1,
                    obscureText: true,
                  ),
                  const FormVerticalSpacing(),
                  PrimaryButton(
                    labelText: 'Enviar',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        authController.signInWithEmailAndPassword(context);
                      }
                    },
                  ),
                  const FormVerticalSpacing(),
                  LabelButton(
                    labelText: 'Crear una cuenta',
                    onPressed: () => Get.to(EmailSignUpUI()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
