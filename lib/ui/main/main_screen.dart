import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/main/main_view_model.dart';
import 'package:flutter_note_application/ui/main/widget/main_background.dart';
import 'package:flutter_note_application/ui/main/widget/note_list_widget.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = context.watch<MainViewModel>();
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 1,
          actions: [
            const SizedBox(
              height: kToolbarHeight, // 앱 바의 높이로 설정
              width: kToolbarHeight, // 앱 바의 높이로 설정
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: RiveAnimation.asset(
                      'assets/rive/cat.riv',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: viewModel.hasData
                  ? () async {
                      bool? confirmDelete =
                          await Commons.onAlertDialog(context: context, title: '전체 삭제', content: '데이터를 전부 삭제하시겠습니까?');
                      if (confirmDelete == true) {
                        await viewModel.deleteAll();
                        await Commons.showSnackBar(context: context, message: '데이터가 전부 삭제되었습니다.');
                      }
                    }
                  : null,
              child: const Text(
                '전체삭제',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        //body 위에 appbar

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.push('/addScreen');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                RiveAnimation.asset(
                  'assets/rive/message_write.riv',
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
        body: const Stack(
          children: [
            /// 백그라운드 설정
            MainBackgorund(),

            /// 노트 리스트
            NoteListWidget(),
          ],
        ));
  }
}
