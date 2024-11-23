import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/screens/gift/gift_screen.dart';

import 'screens/convert/convert_screen.dart';
import 'screens/home/home.dart';
import 'screens/qr_code/qrcode_screen.dart';
import 'screens/request/request_screen.dart';
import 'screens/send/send_screen.dart';
import 'screens/transaction/transaction_details.dart';
import 'screens/transactions/all_transactions.dart';
import 'splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    const ProviderScope(
      child: Witti(),
    ),
  );
}

class Witti extends StatelessWidget {
  const Witti({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
      ],
      locale: const Locale('eu', 'FR'),
      title: 'witti',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        '/': (context) => const WittiHome(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        TransactionDetails.routeName: (context) => const TransactionDetails(),
        AllTransaction.routeName: (context) => const AllTransaction(),
        SendScreen.routeName: (context) => const SendScreen(),
        GiftScreen.routeName: (context) => const GiftScreen(),
        RequestScreen.routeName: (context) => const RequestScreen(),
        ConvertScreen.routeName: (context) => const ConvertScreen(),
        QrcodeScreen.routeName: (context) => const QrcodeScreen(),
      },
    );
  }
}
