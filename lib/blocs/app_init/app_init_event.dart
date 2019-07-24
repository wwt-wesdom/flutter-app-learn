import 'package:wwt_flutter_app/bloc_helpers/bloc_event_state.dart';

class ApplicationInitializationEvent extends BlocEvent {

  final ApplicationInitializationEventType type;

  ApplicationInitializationEvent({this.type: ApplicationInitializationEventType.start,})
      : assert(type != null);
}

enum ApplicationInitializationEventType {
  start,
  stop,
}
