import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductProvider extends ChangeNotifier {
  Future<void> addProductToFirestore(
    String codeController,
    String nameController,
    String priceController,
    String descriptionController,
    XFile selectedImage,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        
        print('User is not signed in');
        return;
      }

      final collectionReference =
          FirebaseFirestore.instance.collection('products').doc(user.uid);
      Map<String, dynamic> productData = {
        'code': codeController,
        'name': nameController,
        'price': priceController,
        'description': descriptionController,
        'userId': user.uid, 
      };

      if (selectedImage != null) {
        
        final storageReference = FirebaseStorage.instance
            .ref()
            .child('product_images/${DateTime.now().toIso8601String()}');
        final uploadTask = storageReference.putFile(File(selectedImage.path));
        final TaskSnapshot snapshot = await uploadTask;
        final imageUrl = await snapshot.ref.getDownloadURL();
        productData['image'] = imageUrl;
      }

      await collectionReference.set(productData);
      print('Product added to Firestore');
    } catch (e) {
      print('Error adding product to Firestore: $e');
    }
  }
}
