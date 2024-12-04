import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'peli.dart'; 

class PeliProvider with ChangeNotifier {
  Future<void> updatePeli(Peli peli) async {
    await FirebaseFirestore.instance.collection('peliculas').doc(peli.id).update({
      'title': peli.title,
      'description': peli.description,
      'imageUrl': peli.imageUrl,
    });
    notifyListeners();
  }

  Future<void> deletePeli(String id) async {
    await FirebaseFirestore.instance.collection('peliculas').doc(id).delete();
    notifyListeners();
  }
}

