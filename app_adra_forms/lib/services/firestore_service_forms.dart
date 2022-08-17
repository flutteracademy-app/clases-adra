import 'package:app_adra_forms/models/form_model.dart';
import 'package:app_adra_forms/models/type_form_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseForms {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static String _collection = "forms";
  static String _collectionTypes = "typesForms";

  Stream<List<FormModel>> formsStream() {
    return _firestore
        .collection(_collection)
        .snapshots()
        .map((QuerySnapshot query) {
      List<FormModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(FormModel.fromJson(element.data() as Map<String, dynamic>));
      }

      return retVal;
    });
  }

  Stream<List<TypeFormModel>> typesFormsStream() {
    return _firestore
        .collection(_collectionTypes)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TypeFormModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(
            TypeFormModel.fromJson(element.data() as Map<String, dynamic>));
      }

      return retVal;
    });
  }

  Future<bool> createNewForm({
    required FormModel model,
    required User user,
    required String typeForm,
  }) async {
    try {
      model.uid = _firestore.collection(_collection).doc().id;
      await _firestore.collection(_collection).doc(model.uid).set({
        "uid": model.uid,
        "name": model.name,
        "nameUser": user.displayName,
        "uidUser": user.uid,
        "description": model.description,
        "typeForm": typeForm
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
