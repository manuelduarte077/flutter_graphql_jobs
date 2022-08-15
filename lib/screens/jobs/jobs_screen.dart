import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_jobs/api/models/jobs/tag.dart';
import 'package:flutter_graphql_jobs/api/models/models.dart';
import 'package:flutter_graphql_jobs/bloc/jobs_bloc.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  static const String routeName = '/jobs';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const JobsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return const CircularProgressIndicator();
            }

            if (state is JobsLoadSuccess) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                      border: Border.all(
                        color: Colors.deepPurple.shade200,
                        width: 1,
                      ),
                    ),
                    child: JobsList(job: job),
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  const JobsList({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: Key(job.id),
          leading: const Icon(Icons.location_city),
          title: InkWell(
            child: Text(job.title),
            onTap: () {
              Navigator.pushNamed(context, '/job-details', arguments: job);
            },
          ),
          trailing: Icon(
            job.isFeatured == true ? Icons.star : Icons.star_border,
            color: Colors.orangeAccent,
          ),
          // subtitle: job.locationNames != null ? Text(job.locationNames!) : null,
          subtitle: Text(job.locationNames ?? ''),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagsJobsList(tags: job.tags),
          ],
        ),
      ],
    );
  }
}

class TagsJobsList extends StatelessWidget {
  TagsJobsList({
    Key? key,
    this.tags,
  }) : super(key: key);

  List<Tag>? tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var tag in tags!)
          Chip(
            label: Text(tag.slug),
            backgroundColor: Colors.deepPurple.shade200,
          ),
      ],
    );
  }
}
