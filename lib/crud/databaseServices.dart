import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> createUpdateMahasiswa(
      BuildContext context, String nama, String author) async {
    DocumentReference mahasiswaReference =
        FirebaseFirestore.instance.collection("mahasiswa").doc(nama);
    Map<String, dynamic> dataMahasiswa = {"nama": nama, "author": author};
    mahasiswaReference.set(dataMahasiswa).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deleteMahasiswa(String nama) async {
    CollectionReference mahasiswaCollection =
        FirebaseFirestore.instance.collection('mahasiswa');
    return await mahasiswaCollection.doc(nama).delete();
  }
}
