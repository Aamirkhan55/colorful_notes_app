import 'package:colorful_notes_app/utils/utility.dart';
import 'package:colorful_notes_app/widgets/button_widget.dart';
import 'package:colorful_notes_app/widgets/dailog_box_widget.dart';
import 'package:colorful_notes_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController? _titleController;
  TextEditingController? _bodyController;

  int selectedColor = 4294967295;
  @override
  void dispose() {
    _titleController!.dispose();
    _bodyController!.dispose();
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
                    icon: Icons.save,
                    onTap: () {
                      showDailogBoxWidget(context,
                          height: 240,
                          title: "Save Changes ?",
                          onTapYes: () {
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
    );
  }
}
