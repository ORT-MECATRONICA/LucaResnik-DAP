import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'peli_provider.dart';  
import 'peli.dart';  class PeliDetailScreen extends StatefulWidget {
  final Peli peli;

  const PeliDetailScreen({required this.peli, Key? key}) : super(key: key);

  @override
  _PeliDetailScreenState createState() => _PeliDetailScreenState();
}

class _PeliDetailScreenState extends State<PeliDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.peli.title);
    _descriptionController = TextEditingController(text: widget.peli.description);
    _imageUrlController = TextEditingController(text: widget.peli.imageUrl);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final peliProvider = Provider.of<PeliProvider>(context, listen: false); 

    return Scaffold(
      appBar: AppBar(title: Text(widget.peli.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Imagen cargada desde URL
            Image.network(
              widget.peli.imageUrl,
              height: 300,
            ),
            const SizedBox(height: 16),

            // Campo para editar el título
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 16),

            // Campo para editar la descripción
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 16),

            // Campo para editar la URL de la imagen
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'URL de la imagen'),
              onChanged: (value) {
                setState(() {}); 
              },
            ),
            const SizedBox(height: 16),

            // Botón para actualizar los datos
            ElevatedButton(
              onPressed: () async {
                widget.peli.title = _titleController.text;
                widget.peli.description = _descriptionController.text;
                widget.peli.imageUrl = _imageUrlController.text;

                await peliProvider.updatePeli(widget.peli); 
                Navigator.of(context).pop();
              },
              child: const Text('Actualizar datos'),
            ),

            // Botón para eliminar
            ElevatedButton(
              onPressed: () async {
                await peliProvider.deletePeli(widget.peli.id);  // Cambié la función para eliminar película
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              ),
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

