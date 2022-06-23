import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_graphql_jobs/api/job_api_client.dart';
import 'package:flutter_graphql_jobs/routes/app_route.dart';
import 'package:flutter_graphql_jobs/screens/screens.dart';

import '../blocs/jobs/jobs_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.jobsApiClient,
  }) : super(key: key);

  final JobsApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JobsBloc(
        jobsApiClient: jobsApiClient,
      )..add(JobsFetchStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,

      ),
    );
  }
}
