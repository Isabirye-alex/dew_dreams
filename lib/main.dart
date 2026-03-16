import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/a_app_theme.dart';
import 'package:dew_dreams/core/widgets/main_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const DewDreams());
}

class DewDreams extends StatelessWidget {
  const DewDreams({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: AAppTheme.lightTheme,
        darkTheme: AAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomeWidget(),
      ),
    );
  }
}
