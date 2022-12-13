import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'edit_note_veiw_body.dart';

class EditNoteVeiw extends StatelessWidget {
  const EditNoteVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteVeiwBody(),
    );
  }
}