import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthClass extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final storage = FlutterSecureStorage();

  Future<void> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        storeTokenAndData(userCredential);
        // Get.offAll(() => HomePage());

        String displayName = userCredential.user?.displayName ?? 'User';
        Get.snackbar('Welcome', displayName);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential?.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      Get.snackbar('Verification Completed', '');
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      Get.snackbar('Error', exception.toString());
    };

    PhoneCodeSent codeSent = (String verificationID, [int? forceResendingToken]) {
      Get.snackbar('Code Sent', 'Verification code sent to $phoneNumber');
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      Get.snackbar('Timeout', 'Auto retrieval timeout');
    };

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      // Get.offAll(() => HomePage());

      Get.snackbar('Success', 'Logged in');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
