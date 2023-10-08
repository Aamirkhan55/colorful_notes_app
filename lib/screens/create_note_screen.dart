import 'package:colorful_notes_app/database/db_handler.dart';
import 'package:colorful_notes_app/model/note_model.dart';
import 'package:colorful_notes_app/utils/utility.dart';
import 'package:colorful_notes_app/widgets/button_widget.dart';
import 'package:colorful_notes_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  bool _isNoteCreating = false;

  int selectedColor = 4294967295;
  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  ButtonWidget(
                    icon: Icons.done,
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(height: 30),
              TextForm(
                hintText: 'Title',
                controller: _titleController,
              ),
              const SizedBox(height: 10),
              TextForm(
                maxLines: 15,
                fontSize: 20,
                hintText: 'Start Typing...',
                controller: _bodyController,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    itemCount: predefinedColors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final singleColor = predefinedColors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = singleColor.value;
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: singleColor,
                            border: Border.all(
                                width: 3,
                                color: selectedColor == singleColor.value
                                    ? Colors.white
                                    : Colors.transparent,
                                    ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createNote () {
    setState(()  =>_isNoteCreating = true);
      Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        if(_titleController.text.isEmpty) {
          toast(message: 'Enter Title');
          setState(()=> _isNoteCreating = false);
          return;
        }
        if(_bodyController.text.isEmpty) {
          toast(message: 'Type Something in body');
          setState(()=> _isNoteCreating = false);
          return;
        }
        DatabaseHandler.createNote(NoteModel(
          title: _titleController.text,
          body: _bodyController.text,
          color: selectedColor,
        )).then((value) {
          _isNoteCreating = false;
          Navigator.pop(context);
        });
      });
    }
  }

