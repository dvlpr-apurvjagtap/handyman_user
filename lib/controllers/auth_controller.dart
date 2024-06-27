import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handyman_user/controllers/db_controller.dart';
import 'package:handyman_user/shared_widget/show_snackbar.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool?> userSignIn(BuildContext context,
      {required String email, required String pass}) async {
    isLoading = true;

    try {
      UserCredential currentUser =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      var userData =
          await DBController.getUserDetail(userId: currentUser.user!.uid);

      if (userData == null) {
        await _auth.signOut();
        showCustomSnackbar(
            context, "User not found in the customer collection!");
        return false;
      } else {
        showCustomSnackbar(context, "Login Successful");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.code, name: "Auth Exception");

      switch (e.code) {
        case 'invalid-email':
          showCustomSnackbar(context, "The email address is not valid.");
          break;
        case 'user-disabled':
          showCustomSnackbar(context,
              "The user corresponding to the given email has been disabled.");
          break;
        case 'user-not-found':
          showCustomSnackbar(
              context, "There is no user corresponding to the given email.");
          break;
        case 'wrong-password':
          showCustomSnackbar(
              context, "The password is invalid for the given email.");
          break;
        default:
          showCustomSnackbar(
              context, "An undefined error occurred. Please try again.");
      }

      return false;
    } finally {
      isLoading = false;
    }
  }

  Future<UserCredential?> userSignUp(
      {required String email,
      required String pass,
      required String name,
      required String contact}) async {
    isLoading = true;

    try {
      UserCredential currentUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      await DBController.storeUserDetails(
          email: email,
          pass: pass,
          name: name,
          contact: contact,
          uid: currentUser.user!.uid);
      return currentUser;
    } on FirebaseAuthException catch (e) {
      log(e.code, name: "Auth Exception");

      switch (e.code) {
        case 'email-already-in-use':
          log("The email address is already in use by another account.");
          break;
        case 'invalid-email':
          log("The email address is not valid.");
          break;
        case 'operation-not-allowed':
          log("Email/Password accounts are not enabled.");
          break;
        case 'weak-password':
          log("The password is not strong enough.");
          break;
        default:
          log("An undefined error occurred. Please try again.");
      }

      return null;
    } finally {
      isLoading = false;
    }
  }
}
