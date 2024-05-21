import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';

@freezed
class Test with _$Test {
  // Added constructor. Must not have any parameter
  const Test._();

  const factory Test({required String name, required int age}) = _Test;

  Test fromDocumentSnapShot(DocumentSnapshot snapshot) {
    return Test(
      name: (snapshot.data() as dynamic)['name'],
      age: (snapshot.data() as dynamic)['age']
    );
  }
}
