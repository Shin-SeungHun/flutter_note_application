import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:go_router/go_router.dart';
import '../../utils/commons.dart';
import '../../utils/enum/custom_colors.dart';

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
  CustomColors selectedColor = CustomColors.roseBud;

  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      NoteItem? noteItem = noteItems.get(widget.id);
      if (noteItem != null) {
        _titleController.text = noteItem.title;
        _contentController.text = noteItem.content;
        selectedColor = CustomColorsExtension.colorFromIndex(noteItem.color);
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_titleController.text.isEmpty) {
            Commons.showSnackBar(context: context, message: '제목을 입력하세요.');
            return;
          }

          if (_contentController.text.isEmpty) {
            Commons.showSnackBar(context: context, message: '내용을 입력하세요.');
            return;
          }

          await noteItems.put(
            widget.id ,
            NoteItem(
              title: _titleController.text,
              content: _contentController.text,
              color: selectedColor.indexValue,
              timeStamp: DateTime.now().millisecondsSinceEpoch,
              id: widget.id ?? noteItems.values.length,
            ),
          )ㅎ
          BuildContext currentContext = context;
          await Future.delayed(Duration.zero, () {
            currentContext.go('/');
          });
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        color: selectedColor.colorValue,
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
                            selectedColor = e;
                          });
                        },
                        child: _buildBackgroundColor(
                            color: e.colorValue, selected: e == selectedColor),
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
                    .copyWith(color: Colors.white),
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
