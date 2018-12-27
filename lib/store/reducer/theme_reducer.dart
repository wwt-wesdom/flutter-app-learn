import 'package:redux/redux.dart';

final ThemeReducer = combineReducers<Map>(
  [
    TypedReducer<Map, ThemeAction>(_fresh),
  ]
);

Map _fresh(Map map, ThemeAction action) {
  print(action.type);
  switch(action.type) {
    case 'change_theme_color': map['color'] = action.params;break;
    case 'change_international':
      map['international'] == 'cn'?map['international'] = 'en':map['international'] = 'cn';
      break;
  }
  return map;
}

class ThemeAction {
  final String type;
  final params;
  ThemeAction(this.type, this.params);
}