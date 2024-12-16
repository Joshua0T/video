import 'package:flutter/material.dart';
import 'package:video/plataforma.dart';
import 'package:provider/provider.dart';



class AddVideoScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subir Video")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Título del video"),
            ),
            TextField(
              controller: durationController,
              decoration: InputDecoration(labelText: "Duración (en minutos)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final duration = int.tryParse(durationController.text) ?? 0;

                if (title.isEmpty || duration <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, ingresa datos válidos.")),
                  );
                  return;
                }

                Provider.of<VideoPlatform>(context, listen: false)
                    .uploadVideo(title, duration);
                Navigator.pop(context);
              },
              child: Text("Agregar Video"),
            ),
          ],
        ),
      ),
    );
  }
}
