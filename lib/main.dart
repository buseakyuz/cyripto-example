import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_app/features/trading_details_view.dart';
import 'package:trading_app/product/providers/coin_provider.dart';
import 'package:trading_app/product/theme/theme_styles.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CoinProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TradingDetailView(),
      theme: ThemeStyles.darkTheme(context),
    );
  }
}
