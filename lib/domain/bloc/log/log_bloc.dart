import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sigest/data/models/log_model/log_model.dart';
import 'package:sigest/domain/repositories/log_repository.dart';

part 'log_event.dart';
part 'log_state.dart';
part 'log_bloc.freezed.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  final LogRepository logRepository;
  LogBloc({required this.logRepository}) : super(const _Loading()) {
    on<LogEvent>(_onLogEvent);
  }

  Future<void> _onLogEvent(LogEvent event, Emitter<LogState> emit) {
    return event.when(
      get: () async {
        emit(const _Loading());
        try {
          final logList = await logRepository.getActionsLog();
          emit(_Loaded(logList: logList));
        } catch (e) {
          debugPrint("error$e");
        }
      },
      add: (LogModel? log) async {
        emit(const _Loading());
        try {
          await logRepository.addActionLog(log: log);
        } catch (e) {
          print("error$e");
        }
      },
    );
  }
}
