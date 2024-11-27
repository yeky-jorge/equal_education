import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/course.dart';
import 'package:flutter_application_1/models/signature.dart';
import 'package:flutter_application_1/services/isar_service.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class LessonScreen extends StatefulWidget {
  final int courseId;
  const LessonScreen({super.key, required this.courseId});

  @override
  State<LessonScreen> createState() => LessonScreenState();
}

class LessonScreenState extends State<LessonScreen> {
  final IsarService isarService = IsarService();
  List<Signature> signatures = [];
  Course? course;

  @override
  void initState() {
    super.initState();
    _loadSignatures();
  }

  Future<void> _loadSignatures() async {
    final loadedCourse = await isarService.getCourseById(widget.courseId);
    final loadedSignatures = await isarService.getSignaturesByCourseId(widget.courseId);
    setState(() {
      course = loadedCourse;

      signatures = loadedSignatures;
      //print('Asignaturas cargadas ${signatures.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/course');
        

          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lecciones',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            course != null
            ? Text(
              'Curso: ${course!.titulo}',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            )
            : SizedBox(height: 10.0),
            Divider(),
            signatures.isEmpty
                ? const Center(child: Text("No hay lecciones para este curso"))
                : Expanded(
                    child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: signatures.length,
                    itemBuilder: (context, index) {
                      final signature = signatures[index];
                      final formattedDate =
                          DateFormat('dd/MM/yyyy').format(signature.date);
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          signature.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Fecha: ${formattedDate}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 0,
                    ),
                  ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => AddLesson(courseId: widget.courseId),
            ),
          );
          if (result == true) {
            _loadSignatures();
          }
        },
        
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      
    );
  }
}

class AddLesson extends StatefulWidget {
  final int courseId;
  const AddLesson({Key? key, required this.courseId}) : super(key: key);

  @override
  _AddLessonState createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _nameController = TextEditingController();

  final IsarService isarService =
      IsarService(); // Servicio para interactuar con Isar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        elevation:
            0, // Elimina la sombra para que no cambie el aspecto al deslizar.
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nueva Lección',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Crea una nueva Lección:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 20),
                // *** INPUT Nombre del Curso ***
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de la Lección',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduzca un nombre';
                    }
                    return null;
                  },
                  cursorColor: Colors.blueAccent,
                ),
                const SizedBox(height: 20),
                // * Botón para agregar Proyecto a base de datos con el valor de sus inputs
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // Crear instancia de Course con los datos de los controladores
            final newSignature = Signature(
              courseId: widget.courseId,
              name: _nameController.text,
              date: DateTime.now(),
            );

            // Guardar el curso en Isar
            await isarService.addSignature(newSignature);
            
            // Regresar a la pantalla anterior
            if (context.mounted) {
              Navigator.pop(context,true);
             
            }
            
          }
        },
        backgroundColor: Colors.black,
        label: Text(
          "Agregar",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
