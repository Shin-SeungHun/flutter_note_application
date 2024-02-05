import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/add/add_view_model.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';
import 'package:go_router/go_router.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({
    super.key,
    required TextEditingController titleController,
    required TextEditingController contentController,
    required AddViewModel viewModel,
  })  : _titleController = titleController,
        _contentController = contentController,
        _viewModel = viewModel;

  final TextEditingController _titleController;
  final TextEditingController _contentController;
  final AddViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        if (_titleController.text.isEmpty) {
          Commons.showSnackBar(context: context, message: '제목을 입력하세요.');
          return;
        }

        if (_contentController.text.isEmpty) {
          Commons.showSnackBar(context: context, message: '내용을 입력하세요.');
          return;
        }

        await _viewModel.saveNote(
            title: _titleController.text,
            content: _contentController.text,
            color: _viewModel.selectedColor.indexValue,
            timeStamp: DateTime.now().millisecondsSinceEpoch);
        BuildContext currentContext = context;
        await Future.delayed(Duration.zero, () {
          Commons.showSnackBar(context: context, message: '"${_titleController.text}"이/가 저장되었습니다.');
          currentContext.push('/');
        });
      },
      child: const Icon(Icons.save),
    );
  }
}
