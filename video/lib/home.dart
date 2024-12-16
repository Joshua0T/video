import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/plataforma.dart';
import 'package:video/addvideos.dart'; // Pantalla para agregar videos

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoPlatform = Provider.of<VideoPlatform>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Plataforma de Videos"),
      ),
      body: videoPlatform.videos.isEmpty
          ? Center(child: Text("No hay videos subidos."))
          : ListView.builder(
              itemCount: videoPlatform.videos.length,
              itemBuilder: (context, index) {
                final title = videoPlatform.videos.keys.elementAt(index);
                final duration = videoPlatform.videos[title]!;
                return ListTile(
                  title: Text(title),
                  subtitle: Text("$duration minutos"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      videoPlatform.removeVideo(title);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVideoScreen()),
          );
        },
      ),
    );
  }
}
