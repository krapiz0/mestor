import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mestorapp/domain/models/models.dart';
import 'package:mestorapp/providers/providers.dart';

class ActivityOptionsDialog extends ConsumerWidget {
  final Activity act;

  const ActivityOptionsDialog({super.key, required this.act});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleDeleteRecord() {
      ref.read(recordsProvider(act.id).notifier).removeLastRecord().then((_) {
        context.pop();
      });
    }

    void handleCustomRecord() {
      showDatePicker(
        context: context,
        lastDate: DateTime.now(),
        firstDate: DateTime(2023),
      ).then((date) {
        if (date == null) return;
        ref
            .read(recordsProvider(act.id).notifier)
            .addRecord(date: date)
            .then((_) {
          context.pop();
        });
      });
    }

    void goToEdit() {
      context.pop();
      context.push("/edit_activity/${act.id}");
    }

    return SimpleDialog(
      title: Column(
        children: [
          Text(
            act.emoji,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(act.name, textAlign: TextAlign.center),
        ],
      ),
      children: [
        SimpleDialogOption(
          onPressed: handleCustomRecord,
          child: const Text("Record with past date"),
        ),
        SimpleDialogOption(
          onPressed: goToEdit,
          child: const Text("Edit"),
        ),
        SimpleDialogOption(
          onPressed: handleDeleteRecord,
          child: const Text(
            "Delete last record",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        const SizedBox(height: 12),
        SimpleDialogOption(
          child: const Text("Close"),
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}