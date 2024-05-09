import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:msb_task3/Network/model/firebase_model.dart';
import 'package:msb_task3/helper/Utils/log_helper.dart';

class FirebaseRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("data");
  Future<void> addDataonFirebase({required String name}) async {
    try {
      await _fireCloud.add({
        "name": name,
      });
    } on FirebaseException catch (e) {
      logger.e("Failed wuth error '${e.code}' : ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirebaseModel>> getFirebasedata() async {
    List<FirebaseModel> proList = [];
    try {
      final pro = await FirebaseFirestore.instance.collection('data').get();
      pro.docs.forEach((element) {
        return proList.add(FirebaseModel.fromJson(element.data()));
      });
      return proList;
    } on FirebaseException catch (e) {
      logger.e("Failed wuth error '${e.code}' : ${e.message}");

      return proList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
