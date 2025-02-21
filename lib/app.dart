import 'package:flutter/material.dart';
import 'package:pdf_download/home_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFDownloadScreen(),
      // onGenerateRoute: AppRouters().onGenerateRoute,
    );
  }
}
