import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicineapp2/Auth/mobile_verification.dart';
import 'package:medicineapp2/dashboard.dart';

import 'Auth/login.dart';
import 'Auth/verifyemail.dart';
import 'firebase_message_provider.dart';
import 'onboarding/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var uid;
String? emailofuser;
String? phoneofuser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(GetMaterialApp(home: MyApp()));
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NotificationListenerProvider().getMessage(context);
    print("dkfkdfkdjfdkfdfdfdfd");

    getToken();
  }

  void getToken() async {
    final token = await _firebaseMessaging.getToken();
    print("dlllllllllllllllll $token");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final isPhoneVerified = snapshot.data?.providerData.any((userInfo) {
          return userInfo.providerId == 'phone' && userInfo.phoneNumber != null;
        });
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final user = snapshot.data;

          if (user == null) {
            return const onboarding();
          } else if (!user.emailVerified) {
            return const verifyemail();
          } else if (!isPhoneVerified!) {
            return const mobile_verification();
          } else {
            uid = snapshot.data?.uid ?? uid;
            emailofuser = snapshot.data?.email ?? emailofuser;
            phoneofuser = snapshot.data?.phoneNumber ?? phoneofuser;
            return const dashboard();
          }
        }
      },
    );
  }
}
