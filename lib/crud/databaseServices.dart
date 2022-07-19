import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> createUpdateMahasiswa(BuildContext context, String judul,
      String deskripsi, String author) async {
    DocumentReference mahasiswaReference =
        FirebaseFirestore.instance.collection("mahasiswa").doc(judul);
    Map<String, dynamic> dataMahasiswa = {
      "judul": judul,
      "deskripsi": deskripsi,
      "author": author
    };
    mahasiswaReference.set(dataMahasiswa).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deleteMahasiswa(String judul) async {
    CollectionReference mahasiswaCollection =
        FirebaseFirestore.instance.collection('mahasiswa');
    return await mahasiswaCollection.doc(judul).delete();
  }
}
