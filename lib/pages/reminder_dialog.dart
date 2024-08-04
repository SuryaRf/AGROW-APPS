import 'package:flutter/material.dart';

class ReminderDialog extends StatefulWidget {
  @override
  _ReminderDialogState createState() => _ReminderDialogState();
}

class _ReminderDialogState extends State<ReminderDialog> {
  final TextEditingController _intervalController = TextEditingController();
  String _selectedTime = "08:00"; // Default time

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Atur Pengingat Penyiraman"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _intervalController,
            decoration: const InputDecoration(
              labelText: 'Masukkan interval (dalam hari)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const Text("Pilih Jam Pengingat:"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text("Pilih Jam ($_selectedTime)"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle saving the reminder
            final interval = _intervalController.text;
            final time = _selectedTime;
            // TODO: Save interval and time to database or local storage
            Navigator.of(context).pop();
          },
          child: Text("Simpan"),
        ),
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: int.parse(_selectedTime.split(':')[0]), minute: int.parse(_selectedTime.split(':')[1])),
    );

    if (picked != null && picked != TimeOfDay.now()) {
      setState(() {
        _selectedTime = picked.format(context);
      });
    }
  }
}
