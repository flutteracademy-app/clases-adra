import 'package:app_adra_forms/layout/componets/validators.dart';
import 'package:app_adra_forms/layout/widgets/buttons/primary_button.dart';
import 'package:app_adra_forms/layout/widgets/forms/form_input_field_with_icon.dart';
import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class EmailSignInUi extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EmailSignInUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                    PrimaryButton(
                      labelText: 'Enviar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
