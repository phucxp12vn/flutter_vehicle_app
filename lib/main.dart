import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'store/reducers/app_reducer.dart';
import 'store/state/app_state.dart';
import 'db/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

final _messageStreamController = BehaviorSubject<RemoteMessage>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final initialState = await AppState.initial();
  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
  );

  final messaging = FirebaseMessaging.instance;

  // Web/iOS app users need to grant permission to receive messages
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  String? token;
  token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor:
              Colors.white, // Background color for all scaffold screens

          // AppBar theme
          appBarTheme: const AppBarTheme(
              color: Colors.white, // AppBar background color
              iconTheme:
                  IconThemeData(color: Colors.orange), // AppBar icon color
              actionsIconTheme: IconThemeData(color: Colors.orange)),
          // Button theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange, // Text color for buttons
            ),
          ),

          // Input field theme
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[100], // Background color for input fields
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orange), // Border color when focused
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.orange), // Border color when enabled
            ),
            iconColor: Colors.orange,
            prefixIconColor: Colors.orange,
            suffixIconColor: Colors.orange,
            // labelStyle:
            //     const TextStyle(color: Colors.orange), // Color of label text
          ),

          // Icon theme
          iconTheme: const IconThemeData(
            color: Colors.orange, // Default color for icons
          ),

          // Floating Action Button theme
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.orange, // Color of FAB
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: FutureBuilder(
          future: AppDatabase.instance.checkLoginState(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show splash screen or loader
            } else {
              // Navigate based on the login state
              if (snapshot.data == true) {
                return const MessageListener(
                    child:
                        DashboardScreen()); // Already logged in, go to dashboard
              } else {
                return const LoginScreen(); // Not logged in, go to login screen
              }
            }
          },
        ),
      ),
    );
  }
}

class MessageListener extends StatelessWidget {
  final Widget child;

  const MessageListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RemoteMessage>(
      stream: _messageStreamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(snapshot.data?.notification?.body ??
                    'New message received'),
              ),
            );
          });
        }
        return child;
      },
    );
  }
}
