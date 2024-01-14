import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/add/add_view_model.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';

class CustomColorListWidget extends StatelessWidget {
  const CustomColorListWidget({
    super.key,
    required AddViewModel viewModel,
    required TextEditingController titleController,
    required TextEditingController contentController,
  })  : _viewModel = viewModel,
        _titleController = titleController,
        _contentController = contentController;

  final AddViewModel _viewModel;
  final TextEditingController _titleController;
  final TextEditingController _contentController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: CustomColors.values
              .map(
                (e) => InkWell(
                  onTap: () {
                    _viewModel.fetchSelectedColor(color: e);
                  },
                  child: _buildBackgroundColor(
                      color: e.colorValue,
                      selected: e == _viewModel.selectedColor),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: _titleController,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.black),
          decoration: const InputDecoration(
            hintText: '제목을 입력하세요',
            hintStyle: TextStyle(color: Colors.black38),
            border: InputBorder.none,
          ),
        ),
        TextField(
          controller: _contentController,
          maxLines: null,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black),
          decoration: const InputDecoration(
            hintText: '내용을 입력하세요',
            hintStyle: TextStyle(color: Colors.black38),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

Widget _buildBackgroundColor({
  required Color color,
  required bool selected,
}) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black54.withOpacity(0.2),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        )
      ],
      border: selected
          ? Border.all(
              color: Colors.black54,
              width: 3.0,
            )
          : null,
    ),
  );
}
