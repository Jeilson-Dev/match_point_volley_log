import 'package:match_point_volley_log/core/core.dart';

Widget widgetBuilder(Widget child) {
  return MaterialApp(
    localizationsDelegates: localizationsDelegates,
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: child),
  );
}

final localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];
