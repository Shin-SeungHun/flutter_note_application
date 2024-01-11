import 'package:flutter/material.dart';
import 'package:flutter_note_application/data/model/note_item.dart';
import 'package:flutter_note_application/main.dart';
import 'package:go_router/go_router.dart';

import '../colors.dart';

class DetailScreen extends StatefulWidget {
  // final NoteItem? noteItems;

  const DetailScreen({
    super.key,
    // required this.noteItems,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  void initState() {
    super.initState();

    // if (widget.noteItems != null) {
    //   _titleController.text = widget.noteItems!.title;
    //   _contentController.text = widget.noteItems!.content;
    // }
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
          await noteItems.add(NoteItem(
              title: _titleController.text,
              content: _contentController.text,
              color: noteColors.length,
              timeStamp: DateTime.now().millisecondsSinceEpoch));
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (e) => InkWell(
                        onTap: () {},
                        child: _buildBackgroundColor(color: e, selected: false),
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
                    .copyWith(color: darkGray),
                decoration: const InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: darkGray,
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
