import 'package:flutter_note_application/router/enum/router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/add/add_screen.dart';
import '../ui/add/add_view_model.dart';
import '../ui/edit/edit_screen.dart';
import '../ui/edit/edit_view_model.dart';
import '../ui/main/main_screen.dart';
import '../ui/main/main_view_model.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: Router.mainScreen.path,
      name: Router.mainScreen.name,
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: MainViewModel(),
          child: const MainScreen(),
        );
      }),
  GoRoute(
      path: '/addScreen',
      name: 'AddScreen',
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: AddViewModel(),
          child: const AddScreen(),
        );
      }),
  GoRoute(
      path: '/editScreen/:id',
      name: 'EditScreen',
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

