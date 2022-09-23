part of 'log_bloc.dart';

@freezed
class LogState with _$LogState {
  const factory LogState.loading() = _Loading;
  const factory LogState.loaded({List<LogModel?>? logList}) = _Loaded;
}
