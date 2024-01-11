import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/add/add_screen.dart';
import '../ui/add/add_view_model.dart';
import '../ui/main/main_screen.dart';
import '../ui/main/main_view_model.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: 'MainScreen',
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: MainViewModel(),
          child: const MainScreen(),
        );
      }),
  GoRoute(
      path: '/detailScreen',
      name: 'DetailScreen',
      builder: (context, state) {
        // final NoteItem? noteItems = state['note.db'] as NoteItem?;
        return ChangeNotifierProvider.value(
          value: AddViewModel(),
          child:   const AddScreen(),
        );
      }),
]);
