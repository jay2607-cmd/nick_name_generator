import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nick_name/splash.dart';
import 'package:path_provider/path_provider.dart';

import 'database/bookmark.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(BookmarkAdapter());
  await Hive.openBox<Bookmark>("bookmark");

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),

          // You can define more text styles here if needed
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Nick Name',
      home: Splash(),
    );
  }
}
