import 'package:flutter/material.dart';
import 'package:flutter_graphql_jobs/screens/screens.dart';

import '../../customs_widgets/primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(
            HomeScreen.routeName,
          ),
          text: 'Go Home',
        ),
      ),
    );
  }
}
