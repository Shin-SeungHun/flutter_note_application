import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/add_note/add_note_screen.dart';
import '../ui/main/main_screen.dart';
import '../ui/main/main_view_model.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: MainViewModel(),
          child: const MainScreen(),
        );
      }),
  GoRoute(
      path: '/addNoteScreen',
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: MainViewModel(),
          child: const AddNoteScreen(),
        );
      }),
]);
