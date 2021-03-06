import 'package:wwt/bloc_helpers/bloc_event_state.dart';
import 'package:wwt/blocs/app_init/app_init_state.dart';
import 'package:wwt/blocs/app_init/app_init_event.dart';
import 'dart:async' show Stream;

class ApplicationInitializationBloc
    extends BlocEventStateBase<ApplicationInitializationEvent, ApplicationInitializationState> {
  ApplicationInitializationBloc()
      : super(
    initialState: ApplicationInitializationState.notInitialized(),
  );

  @override
  Stream<ApplicationInitializationState> eventHandler(ApplicationInitializationEvent event, ApplicationInitializationState currentState) async* {

    if (!currentState.isInitialized){
      yield ApplicationInitializationState.notInitialized();
    }

    if (event.type == ApplicationInitializationEventType.start) {
      for (int progress = 0; progress < 101; progress += 20){
        await Future.delayed(const Duration(milliseconds: 100));
        yield ApplicationInitializationState.progressing(progress);
      }
    }

    if (event.type == ApplicationInitializationEventType.stop){
      yield ApplicationInitializationState.initialized();
    }
  }
}
