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
            ],
          ),
        ),
      ),
    );
  }
}