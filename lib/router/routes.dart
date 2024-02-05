import 'package:flutter_note_application/router/enum/router.dart';
import 'package:flutter_note_application/ui/add/add_screen.dart';
import 'package:flutter_note_application/ui/add/add_view_model.dart';
import 'package:flutter_note_application/ui/edit/edit_screen.dart';
import 'package:flutter_note_application/ui/edit/edit_view_model.dart';
import 'package:flutter_note_application/ui/main/main_screen.dart';
import 'package:flutter_note_application/ui/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: Router.mainScreen.path,
      name: Router.mainScreen.name,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create:(_) => MainViewModel(),
          child: const MainScreen(),
        );
      }),
  GoRoute(
      path: Router.addScreen.path,
      name: Router.addScreen.name,
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: AddViewModel(),
          child: const AddScreen(),
        );
      }),
  GoRoute(
      path: Router.editScreen.path,
      name: Router.editScreen.name,
      builder: (context, state) {
        return ChangeNotifierProvider.value(
            value: EditViewModel(),
            child: EditScreen(
              id: int.parse(
                state.pathParameters['id']!,
              ),
            ));
      }),
]);

