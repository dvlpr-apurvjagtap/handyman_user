import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_user/models/booking_card_model.dart';
import 'package:handyman_user/models/categogy_card_model.dart';

Future<List<BookingCardModel>> loadBookings() async {
  // await Future.delayed(Duration(seconds: 2));
  // debugPrint("API called");

  final String response =
      await rootBundle.loadString('lib/services/booking.json');
  List<dynamic> jsonList = json.decode(response);
  return jsonList.map((json) => BookingCardModel.fromJson(json)).toList();
}

Future<List<CategoryCardModel>> loadCategories() async {
  final String response =
      await rootBundle.loadString('lib/services/category.json');
  List<dynamic> jsonList = json.decode(response);
  return jsonList.map((json) => CategoryCardModel.fromJson(json)).toList();
}
