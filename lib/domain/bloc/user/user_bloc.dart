import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sigest/data/models/user_model/user_model.dart';
import 'package:sigest/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(const _Loading()) {
    on<UserEvent>(_onUserEvent);
  }

  Future<void> _onUserEvent(UserEvent event, Emitter<UserState> emit) {
    return event.when(
      get: () async {
        emit(const _Loading());
        try {
          final userModel = await userRepository.getCurrentUser();
          emit(_Loaded(userModel: userModel));
        } catch (e) {
          debugPrint("error$e");
        }
      },
    );
  }
}
