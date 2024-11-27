import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_list.dart';
import 'package:flutter_application_1/services/isar_service.dart';
import 'package:go_router/go_router.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key}); // Agregué el punto y coma

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final IsarService isarService = IsarService();
  late Future<List<Todo>> _todoList;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    setState(() {
      _todoList = isarService.getTodos(); // Utiliza isarService para obtener los todos
    });
  }

  Future<void> _addTodo() async {
    String title = "";
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar nueva tarea'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Nombre de la tarea'),
            onChanged: (value) {
              title = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );

    if (title.isNotEmpty) {
      final newTodo = Todo()
        ..title = title
        ..time = DateTime.now().add(Duration(hours: 1))
        ..isCompleted = false;

      await isarService.addTodo(newTodo); // Utiliza isarService para agregar el todo
      _loadTodos(); // Recarga la lista de todos después de agregar uno nuevo
    }
  }

  Future<void> _deleteTodoById(int id) async {
    await isarService.deleteTodoById(id);
    _loadTodos(); // Recarga la lista de todos después de eliminar uno
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mis tareas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            context.go('/course');
          },
        ),
        
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Todo>>(
        future: _todoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar tareas'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tienes tareas'));
          } else {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return GestureDetector(
                  onLongPress: () async {
                    await _deleteTodoById(todo.id); // Elimina el todo al mantener presionado
                  },
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    
                    leading: Checkbox(
                      value: todo.isCompleted,
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      onChanged: (value) async {
                        setState(() {
                          todo.isCompleted = value!;
                        });
                        await isarService.updateTodo(todo); // Utiliza isarService para actualizar el todo
                        _loadTodos(); // Recarga la lista de todos después de actualizar
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
