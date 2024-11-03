import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/provider.dart';
import 'package:todo/view/details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TODO"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<TodoProvider>(builder: (context, value, child) {
                  value.getTasks();
                  return value.notelist.isEmpty
                      ? Lottie.asset(
                          'assets/lottie/Animation - 1705141161396.json',
                          width: double.infinity)
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.white,
                              height: 5,
                            );
                          },
                          itemBuilder: (context, index) {
                            final data = value.notelist.length - index - 1;
                            final task = value.notelist[data];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Details(),
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        task.name.toString().trim(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              var id = task.id;
                                              value.deletetodo(id);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // editScreen(
                                              //     task.name.toString(),
                                              //     task.email.toString(),
                                              //     task.id,
                                              //     context);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: value.notelist.length,
                        );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomsheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void bottomsheet(context) {
    final todoprovider = Provider.of<TodoProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: todoprovider.namecontroller,
                decoration: const InputDecoration(
                  labelText: "Enter the name",
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                minLines: 5,
                maxLines: null,
                controller: todoprovider.emailcontroller,
                decoration: InputDecoration(
                  labelText: "Enter the email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              TextFormField(
                controller: todoprovider.phonecontroller,
                decoration: const InputDecoration(
                  labelText: "Enter the phone",
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: todoprovider.insttituteIdcontroller,
                decoration: const InputDecoration(
                  labelText: "Enter the institute id",
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  todoprovider.createtodo();
                  Navigator.pop(context);
                  todoprovider.namecontroller.clear();
                  todoprovider.emailcontroller.clear();
                },
                icon: const Icon(Icons.save),
                label: const Text("SAVE"),
              )
            ],
          ),
        );
      },
    );
  }

  // editScreen(String  content, String subject, id) {
  // editScreen(String content, String subject, id, context) {
  //   final TextEditingController subjectController =
  //       TextEditingController(text: subject);
  //   final TextEditingController contentController =
  //       TextEditingController(text: content);

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Edit Screen"),
  //         content: Column(
  //           children: [
  //             TextFormField(
  //               controller: subjectController,
  //               decoration: const InputDecoration(labelText: "Subject"),
  //             ),
  //             TextFormField(
  //               controller: subjectController,
  //               decoration: const InputDecoration(labelText: "Subject"),
  //             ),
  //             TextFormField(
  //               controller: subjectController,
  //               decoration: const InputDecoration(labelText: "Subject"),
  //             ),
  //             TextFormField(
  //               controller: contentController,
  //               decoration: const InputDecoration(labelText: "Content"),
  //             ),
  //             ElevatedButton.icon(
  //               onPressed: () {
  //                 String newSubject = subjectController.text.trim();
  //                 String newContent = contentController.text.trim();
  //                 // Provider.of<TodoProvider>(context, listen: false)
  //                 //     .edittodo(newSubject, newContent, id);
  //                 Navigator.pop(context);
  //               },
  //               icon: const Icon(Icons.update),
  //               label: const Text("UPDATE"),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
