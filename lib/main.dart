import 'package:flutter/material.dart';
import 'linuxui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}
