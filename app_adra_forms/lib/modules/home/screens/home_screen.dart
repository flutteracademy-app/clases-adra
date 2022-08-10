import 'package:app_adra_forms/models/form_model.dart';
import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/controller/form_controller.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/views/create_empty_form_screen.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/views/types_forms_screen.dart';
import 'package:app_adra_forms/modules/home/screens/details_screen.dart';
import 'package:app_adra_forms/services/firestore_service_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FormModel formModel = FormModel(
    //     description: "Hola soy un formulario 3", name: "nuevo formulario 3");
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              heroTag: "Boton 1",
              child: const Icon(Icons.add),
              onPressed: () {
                Get.to(TypesFormsScreen());
                // Get.to(CreateEmptyFormScreen());
                // DatabaseForms().createNewForm(
                //   model: formModel,
                //   user: authController.firebaseUser.value!,
                // );
              }),
          FloatingActionButton(
              heroTag: "Boton 2",
              child: const Icon(Icons.person),
              onPressed: () {
                authController.signOut();
              }),
        ],
      ),
      body: GetBuilder<FormController>(
        builder: (formController) => Obx(
          () => ListView.builder(
            itemCount: formController.formsList.value.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  Get.to(() => DetailsScreen(
                        formModel: formController.formsList.value[index],
                      ));
                },
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Text(
                    formController.formsList.value[index].name!,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
