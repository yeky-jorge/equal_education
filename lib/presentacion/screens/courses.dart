import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/course.dart';
import 'package:flutter_application_1/services/isar_service.dart';
import 'package:go_router/go_router.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => CoursesScreenState();
}

class CoursesScreenState extends State<CoursesScreen> {
  final IsarService isarService = IsarService();
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    final loadedCourses = await isarService.getCourses();
    setState(() {
      courses = loadedCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            } else {
              context.go('/course');
            }
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
            ),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset('lib/assets/img/7.png', width: 90),
                      ),
                    )),
              SizedBox(height: 12),
              GestureDetector(
                  onTap: () {
                    context.go('/todo/');

                    
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Mis Tareas',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Image.asset('lib/assets/img/task.png', width: 20),
                        ]),
                  )),
            ]),
            // Texto visible solo si no hay asignaturas
            SizedBox(height: 20),

            Text(
              'Mis asignaturas',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 8),
            Divider(
              height: 1.0,
            ),
            Text(
              'Selecciona o crea un proyecto',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),

            // ListView o mensaje de lista vacía
            courses.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'No tienes asignaturas registradas. \n¡Crea una nueva para comenzar!',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            '${course.titulo}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                'Profesor: ${course.professor}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 1),
                              Text(
                                'Descripción: ${course.description}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              Divider(
                                height: 6,
                              )
                            ],
                          ),
                          onTap: () {
                            context.go('/signature/${course.id}');
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 0,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAsignatura()),
          ); // Navegar a la pantalla de agregar asignatura
          _loadCourses();
        },
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class AddAsignatura extends StatefulWidget {
  @override
  _AddAsignaturaState createState() => _AddAsignaturaState();
}

class _AddAsignaturaState extends State<AddAsignatura> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _profesorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                  'Nuevo Curso',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Crea un nuevo Curso:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 20),
                // *** INPUT Nombre del Curso ***
                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Curso',
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
                // *** INPUT Profesor ***
                TextFormField(
                  controller: _profesorController,
                  decoration: const InputDecoration(
                    labelText: 'Profesor',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduzca un profesor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // *** INPUT Descripción ***
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduzca una descripción';
                    }
                    return null;
                  },
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
            final newCourse = Course(
              titulo: _tituloController.text,
              professor: _profesorController.text,
              description: _descriptionController.text,
            );

            // Guardar el curso en Isar
            await isarService.addCourse(newCourse);

            // Regresar a la pantalla anterior

            if (context.mounted) {
              Navigator.pop(context);
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
