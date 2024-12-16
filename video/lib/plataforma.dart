import 'package:flutter/material.dart';

class VideoPlatform with ChangeNotifier {
  // Lista de videos: título como clave y duración en minutos como valor
  final Map<String, int> _videos = {};

  // Getter para acceder a los videos
  Map<String, int> get videos => _videos;

  // Método para subir un video
  void uploadVideo(String title, int duration) {
    if (title.isNotEmpty && duration > 0) {
      _videos[title] = duration;
      notifyListeners(); // Notifica a los widgets que usan esta clase
    }
  }

  // Método para eliminar un video
  void removeVideo(String title) {
    if (_videos.containsKey(title)) {
      _videos.remove(title);
      notifyListeners();
    }
  }

  // Método para mostrar videos (en este caso devuelve un String)
  String displayVideos() {
    if (_videos.isEmpty) {
      return "No hay videos disponibles.";
    }
    return _videos.entries
        .map((entry) => "${entry.key}: ${entry.value} minutos")
        .join("\n");
  }
}
