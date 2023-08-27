import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/navigatore_cubit.dart';
import 'package:noteapp/views/screens/sheet_note.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';
import 'package:noteapp/views/widgets/navigationbar.dart';
import 'package:noteapp/views/widgets/note_list_view.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class NotePage extends StatelessWidget {
  static String id = 'NotePage';
  const NotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatoreCubit, NavigatoreState>(
      listener: (context, state) {
        int currentIndex =
            BlocProvider.of<NavigatoreCubit>(context).currentIndex;
        if (currentIndex == 1) {}
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustombottomBar(
            currentIndex:
                BlocProvider.of<NavigatoreCubit>(context).currentIndex,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              var contentCtrl = TextEditingController();
              var titleCtrl = TextEditingController();
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) => NoteSheet(
                  titleCtrl: titleCtrl,
                  contentCtrl: contentCtrl,
                  formkey: GlobalKey<FormState>(),
                ),
              );
            },
          ),
          body: Column(
            children: [
              CustomAppBar(
                title: 'Notes',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              const VerticalSizedBox(8),
              const ListViewNotes(),
            ],
          ),
        );
      },
    );
  }
}
