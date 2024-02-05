import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:flutter_note_application/ui/edit/edit_view_model.dart';
import 'package:flutter_note_application/ui/edit/widget/floating_action_widget.dart';
import 'package:flutter_note_application/utils/commons.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final int? id;

  const EditScreen({
    super.key,
    required this.id,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  CustomColors _selectedColor = CustomColors.roseBud;

  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      NoteItem? noteItem = noteItems.get(widget.id);
      if (noteItem != null) {
        _titleController.text = noteItem.title;
        _contentController.text = noteItem.content;
        _selectedColor = CustomColorsExtension.colorFromIndex(noteItem.color);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EditViewModel _viewModel = context.watch<EditViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionWidget(
          titleController: _titleController,
          contentController: _contentController,
          viewModel: _viewModel,
          widget: widget,
          selectedColor: _selectedColor),
      body: AnimatedContainer(
        color: _selectedColor.colorValue,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: CustomColors.values
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          setState(() {
                            _selectedColor = e;
                          });
                        },
                        child: _buildBackgroundColor(
                            color: e.colorValue, selected: e == _selectedColor),
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
                decoration: InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
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
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        )
      ],
      border: selected
          ? Border.all(
              color: Colors.black,
              width: 3.0,
            )
          : null,
    ),
  );
}
