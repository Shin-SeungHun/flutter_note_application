import 'package:flutter/material.dart';
import 'package:flutter_note_application/ui/add/add_view_model.dart';
import 'package:flutter_note_application/ui/add/widget/custom_color_widget.dart';
import 'package:flutter_note_application/ui/add/widget/floating_action_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_note_application/utils/enum/custom_colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AddViewModel _viewModel = context.watch<AddViewModel>();
    // AddViewModel _viewModel = AddViewModel();
    return Scaffold(
      floatingActionButton: FloatingActionWidget(
          titleController: _titleController,
          contentController: _contentController,
          viewModel: _viewModel),
      body: AnimatedContainer(
        color: _viewModel.selectedColor.colorValue,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          child: CustomColorListWidget(
              viewModel: _viewModel,
              titleController: _titleController,
              contentController: _contentController),
        ),
      ),
    );
  }
}
