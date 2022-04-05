import 'package:flutter/material.dart';
import 'package:flutter_graphql_jobs/api/models/models.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class JobsDetailScreen extends StatelessWidget {
  final Job job;
  const JobsDetailScreen({Key? key, required this.job}) : super(key: key);

  static const String routeName = '/job-details';

  static Route route({required Job job}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => JobsDetailScreen(
        job: job,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                job.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                job.locationNames ?? '',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              MarkdownBody(
                data: job.description,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
