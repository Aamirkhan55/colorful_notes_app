import 'package:colorful_notes_app/database/db_handler.dart';
import 'package:colorful_notes_app/model/note_model.dart';
import 'package:colorful_notes_app/theme/colors.dart';
import 'package:colorful_notes_app/utils/utility.dart';
import 'package:colorful_notes_app/widgets/button_widget.dart';
import 'package:colorful_notes_app/widgets/dailog_box_widget.dart';
import 'package:colorful_notes_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteScreen({super.key, required this.noteModel});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController? _titleController;
  TextEditingController? _bodyController;
  int selectedColor = 4294967295;

  bool _isNoteEditing = false;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.noteModel.title);
    _bodyController = TextEditingController(text: widget.noteModel.body);
    selectedColor = widget.noteModel.color!;
    super.initState();
  }

  @override
  void dispose() {
    _titleController!.dispose();
    _bodyController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
          _isNoteEditing == true ? lightGreyColor : darkBackgroundColor,
      body: AbsorbPointer(
        absorbing: _isNoteEditing,
        child: Stack(
          alignment: Alignment.center,
          children: [ 
            _isNoteEditing == true
                ? Image.asset(
                    "assets/ios_loading.gif",
                    width: 50,
                    height: 50,
                  )
                : Container(),
            Padding(
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
                        icon: Icons.save,
                        onTap: () {
                          showDailogBoxWidget(context,
                              height: 240,
                              title: "Save Changes ?",
                              onTapYes: () {
                                editNote();
                               Navigator.pop(context);
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextForm(
                    hintText: 'Title',
                    controller: _titleController!,
                  ),
                  const SizedBox(height: 10),
                  TextForm(
                    maxLines: 15,
                    fontSize: 20,
                    hintText: 'Start Typing...',
                    controller: _bodyController!,
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
           ]),
      ),
    );
  }

 editNote() {
    setState(() => _isNoteEditing = true);
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      if (_titleController!.text.isEmpty) {
        toast(message: 'Enter Title');
        setState(() => _isNoteEditing = false);
        return;
      }
      if (_bodyController!.text.isEmpty) {
        toast(message: 'Type Something in body');
        setState(() => _isNoteEditing = false);
        return;
      }
      DatabaseHandler.updateNote(NoteModel(
        id: widget.noteModel.id,
        title: _titleController!.text,
        body: _bodyController!.text,
        color: selectedColor,
      )).then((value) {
        _isNoteEditing = false;
        Navigator.pop(context);
      });
    });
  }
}
 

