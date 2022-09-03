import 'package:flutter/material.dart';
import 'package:flutter_graphql_jobs/api/models/models.dart';
import 'package:flutter_graphql_jobs/jobs/jobs_screen.dart';
import 'package:flutter_graphql_jobs/jobs/jobs_details.dart';
import 'package:flutter_graphql_jobs/utils/error_route.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return JobsScreen.route();
      case '/jobs':
        return JobsScreen.route();
      case '/job-details':
        return JobsDetailScreen.route(job: settings.arguments as Job);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const ErrorRoutes(),
    );
  }
}
