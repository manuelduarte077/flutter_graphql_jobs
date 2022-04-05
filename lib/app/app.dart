import 'package:flutter/material.dart';

import 'package:flutter_graphql_jobs/routes/app_route.dart';
import 'package:flutter_graphql_jobs/screens/jobs_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: JobsScreen.routeName,
    );
  }
}
