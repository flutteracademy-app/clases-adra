import 'package:app_adra_forms/models/form_model.dart';
import 'package:app_adra_forms/services/firestore_service_forms.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  Rx<List<FormModel>> formsList = Rx<List<FormModel>>([]);

  DatabaseForms databaseForms = DatabaseForms();

  @override
  void onReady() {
    formsList.bindStream(databaseForms.formsStream());
    super.onReady();
  }
}
