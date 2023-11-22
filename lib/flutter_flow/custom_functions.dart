import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? date() {
  // return the current date in yyyy-MM-dd format
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

bool? avaiabletime() {
  // Current time is between 6 AM and 2 PM
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, now.day, 6);
  final end = DateTime(now.year, now.month, now.day, 14);
  return now.isAfter(start) && now.isBefore(end);
}

DateTime? yesterday() {
  // return yesterday 11 PM
  return DateTime.now()
      .subtract(Duration(days: 1))
      .subtract(Duration(hours: DateTime.now().hour))
      .subtract(Duration(minutes: DateTime.now().minute))
      .add(Duration(hours: 23));
}

DateTime? todayend() {
  return DateTime.now()
      .subtract(Duration(hours: DateTime.now().hour))
      .subtract(Duration(minutes: DateTime.now().minute))
      .add(Duration(hours: 23));
}

DateTime? yeasterdaystart() {
  return DateTime.now()
      .subtract(Duration(days: 1))
      .subtract(Duration(hours: DateTime.now().hour))
      .subtract(Duration(minutes: DateTime.now().minute))
      .add(Duration(hours: 5));
}
