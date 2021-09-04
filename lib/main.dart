import 'package:flutter/material.dart';
import 'package:movie_app/app/providers.dart';
import 'package:movie_app/app/routes/app.routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: remoteProviders,
      child: Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
