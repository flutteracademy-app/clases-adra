import 'package:app_adra_forms/layout/componets/validators.dart';
import 'package:app_adra_forms/layout/widgets/buttons/primary_button.dart';
import 'package:app_adra_forms/models/form_model.dart';
import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/controller/form_controller.dart';
import 'package:app_adra_forms/services/firestore_service_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTextFormScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormController formController = FormController.to;
  final AuthController authController = AuthController.to;
  CreateTextFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.back();
      }),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                    ),
                    controller: formController.nameFormController,
                    onSaved: (value) =>
                        formController.nameFormController.text == value,
                    onChanged: (value) => null,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    minLines: 1,
                    validator: Validator().name,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                      labelText: 'Enviar',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          FormModel formModel = FormModel(
                            description:
                                formController.descriptionFormController.text,
                            name: formController.nameFormController.text,
                          );

                          await DatabaseForms().createNewForm(
                            model: formModel,
                            user: authController.firebaseUser.value!,
                            form: TypeForm.textForm,
                          );

                          formController.nameFormController.clear();

                          Get.back();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
