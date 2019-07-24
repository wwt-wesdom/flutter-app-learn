import 'package:flutter/material.dart';
import 'package:wwt_flutter_app/blocs/bloc_provider.dart';


class CountIncrement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('under Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            bloc.increment();
          }
      ),
    );
  }
}
