import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_graphql_jobs/api/api.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({required JobsApiClient jobsApiClient})
      : _jobsApiClient = jobsApiClient,
        super(JobsLoadInProgress()) {
    on<JobsFetchStarted>(_onJobsFetchStarted);
  }

  final JobsApiClient _jobsApiClient;

  void _onJobsFetchStarted(
    JobsFetchStarted event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsLoadInProgress());
    try {
      final jobs = await _jobsApiClient.getJobs();
      emit(JobsLoadSuccess(jobs: jobs));
    } catch (_) {
      emit(JobsLoadFailure());
    }
  }
}
