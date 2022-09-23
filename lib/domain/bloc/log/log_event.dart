part of 'log_bloc.dart';

@freezed
class LogEvent with _$LogEvent {
  const factory LogEvent.get() = _Get;
  const factory LogEvent.add({LogModel? log}) = _Add;
}
