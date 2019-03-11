import 'package:flutter/material.dart';
///bloc
import 'bloc_init_bloc.dart';
import 'app_init_event.dart';
import 'app_init_state.dart';
import 'package:flutter_app/bloc_helpers/bloc_event_state_builder.dart';
///router
import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  _InitializationPageState(){
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  ApplicationInitializationBloc bloc;
  @override
  void initState(){
    super.initState();
    bloc = ApplicationInitializationBloc();
    bloc.emitEvent(ApplicationInitializationEvent());
  }

  @override
  void dispose(){
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext pageContext) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: BlocEventStateBuilder<ApplicationInitializationEvent, ApplicationInitializationState>(
              bloc: bloc,
              builder: (BuildContext context, ApplicationInitializationState state){
                if (state.isInitialized){
                  //
                  // Once the initialization is complete, let's move to another page
                  //
                  WidgetsBinding.instance.addPostFrameCallback((_){
                    Application.router.navigateTo(context, "/home-screen",replace:true);
                  });
                }
                print(state.progress);
                return Text('Initialization in progress... ${state.progress}%');
              },
            ),
          ),
        ),
      ),
    );
  }
}
