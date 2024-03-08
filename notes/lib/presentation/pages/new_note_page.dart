import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:notes/models/note/note.dart';
import 'package:notes/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage>
    with TickerProviderStateMixin {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    contentController = TextEditingController();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    tabController.removeListener(() {});
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const Align(
          alignment: Alignment.center,
          child: SizedBox.square(
            dimension: 50,
            child: BackButton(),
          ),
        ),
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: "Title of your note...",
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Generate note title with AI
            },
            tooltip: "Generate title with AI",
            icon: const Icon(Icons.auto_awesome_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          context.read<NotesProvider>().addNote(
                Note.fromTitleAndText(
                  title: titleController.text,
                  text: contentController.text,
                ),
              );
          Navigator.pop(context);
        },
        tooltip: "Add note",
        child: const Icon(Icons.add_rounded),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_rounded),
                    SizedBox(width: 10),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye_rounded),
                    SizedBox(width: 10),
                    Text(
                      "View",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    border: InputBorder.none,
                  ),
                ),
                Markdown(
                  data: contentController.text,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
