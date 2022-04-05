import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_graphql_jobs/bloc/jobs_bloc.dart';
import 'package:flutter_graphql_jobs/api/job_api_client.dart';
import 'package:flutter_graphql_jobs/routes/app_route.dart';
import 'package:flutter_graphql_jobs/screens/jobs_screen.dart';

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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: JobsScreen.routeName,
      ),
    );
  }
}
