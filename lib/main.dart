import 'package:flutter/material.dart';
import 'package:flutter_graphql_jobs/api/api.dart';
import 'package:flutter_graphql_jobs/app/app.dart';

void main() {
  runApp(MyApp(jobsApiClient: JobsApiClient.create()));
}
