import 'package:flutter/material.dart';

import 'backup_option.dart';
import 'restore_option.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          BackupOption(),
          RestoreOption(),
        ],
      ),
    );
  }
}
