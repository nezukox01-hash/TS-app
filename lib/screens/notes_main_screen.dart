import 'package:flutter/material.dart';

import '../widgets/notes_menu_card.dart';

class NotesMainScreen extends StatelessWidget {
  const NotesMainScreen({
    super.key,
    required this.onOpenList,
  });

  final VoidCallback onOpenList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NotesMenuCard(title: 'All Notes', onTap: onOpenList),
      ],
    );
  }
}
