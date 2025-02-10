import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

import 'api_exception.dart';

class ApiService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();
  // ========== FIRESTORE METHODS ==========

  Future<String> setDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      final docRef = documentId == null
          ? firestore.collection(collectionPath).doc()
          : firestore.collection(collectionPath).doc(documentId);

      data['id'] = docRef.id;

      await docRef.set(data, SetOptions(merge: true));
      return docRef.id;
    } catch (e) {
      throw ApiException(message: 'Failed to set document: $e');
    }
  }

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      final docRef = firestore.collection(collectionPath).doc(documentId);
      DocumentSnapshot doc = await docRef.get();
      return doc.exists ? doc.data() as Map<String, dynamic>? : null;
    } catch (e) {
      throw ApiException(message: 'Failed to get document: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCollection(
    String collectionPath,
  ) async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionPath).get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw ApiException(message: 'Failed to get collection: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getCollectionStream(
    String collectionPath,
  ) {
    try {
      return firestore
          .collection(collectionPath)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      throw ApiException(message: 'Failed to stream collection: $e');
    }
  }

  Future<void> deleteDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      final docRef = firestore.collection(collectionPath).doc(documentId);
      await docRef.delete();
    } catch (e) {
      throw ApiException(message: 'Failed to delete document: $e');
    }
  }

  // ========== FIREBASE STORAGE METHODS ==========

  Future<String?> uploadFile(File imageFile, String path) async {
    try {
      final storageRef = storage.ref().child(path);
      await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw ApiException(message: 'Failed to upload file: $e');
    }
  }

  Future<void> deleteFile(String path) async {
    try {
      final storageRef = storage.ref().child(path);

      // Check if the file exists by attempting to get its metadata
      await storageRef.getMetadata();

      // If metadata retrieval succeeds, delete the file
      await storageRef.delete();
    } catch (e) {
      if (!(e is FirebaseException && e.code == 'object-not-found')) {
        throw ApiException(message: 'Failed to delete file at path: $path');
      }
    }
  }

  Future<Uint8List?> downloadFileAsBytes(String path) async {
    try {
      final storageRef = storage.ref().child(path);
      final data = await storageRef.getData();
      if (data != null) {
        return Uint8List.fromList(data);
      }
    } catch (e) {
      throw ApiException(message: 'Failed to download file: $e');
    }
    return null;
  }
}
