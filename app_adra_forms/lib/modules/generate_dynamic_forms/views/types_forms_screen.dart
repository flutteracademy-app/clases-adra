import 'package:app_adra_forms/modules/generate_dynamic_forms/controller/form_controller.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/views/create_empty_form_screen.dart';
import 'package:app_adra_forms/modules/generate_dynamic_forms/views/create_text_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypesFormsScreen extends StatelessWidget {
  const TypesFormsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.back();
      }),
      body: GetBuilder<FormController>(
        builder: (formController) => Obx(
          () => ListView.builder(
            itemCount: formController.typeFormsList.value.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  if (formController.typeFormsList.value[index].type ==
                      "emptyForm") {
                    Get.to(CreateEmptyFormScreen(
                      typeFormModel: formController.typeFormsList.value[index],
                    ));
                  } else if (formController.typeFormsList.value[index].type ==
                      "textForm") {
                    Get.to(
                      CreateTextFormScreen(
                        typeFormModel:
                            formController.typeFormsList.value[index],
                      ),
                    );
                  } else {
                    print("Otrooooo");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: 50,
                    color: Colors.pink,
                    child: Text(
                        formController.typeFormsList.value[index].type ?? ''),
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
