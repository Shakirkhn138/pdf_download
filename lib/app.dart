import 'package:flutter/material.dart';
import 'package:pdf_download/View/home_screen/home_screen.dart';

import 'config/app_routers.dart';

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
