import 'package:flutter/material.dart';

import 'package:rapid_api_provider/presentation/app.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api_provider/presentation/search.dart';

import 'infrastructure/app.state.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            // showPerformanceOverlay: true,
            home: App(),
          );
        }),
  );
}
