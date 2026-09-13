import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<List<dynamic>> sorted = [];
  List<String> box = [];
  final TextEditingController dubba = TextEditingController();
  final TextEditingController urg = TextEditingController();
  final TextEditingController imp = TextEditingController();
  int? urgency = 0;
  int? importance = 0;
  int show = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Just V0"),
        backgroundColor: Color(0xFFCEA2d7),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(sorted[index][0].toString()),
                      ),
                    ),
                    MaterialButton(
                      child: Icon(Icons.check_box),
                      onPressed: () {
                        setState(() {
                          sorted.removeAt(index);
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: dubba,
                          decoration: InputDecoration(
                            label: Text("Enter today's quest"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Urgency ="),
                                SizedBox(width: 30),
                                SizedBox(
                                  width: 100,
                                  child: TextField(controller: urg),
                                ),
                                SizedBox(width: 40),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Importance ="),
                                SizedBox(width: 15),
                                SizedBox(
                                  width: 100,
                                  child: TextField(controller: imp),
                                ),
                                SizedBox(width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              sorted.add([
                                dubba.text,
                                int.parse(urg.text) + int.parse(imp.text),
                              ]);
                              sorted.sort((a, b) => b[1].compareTo(a[1]));
                              urg.clear();
                              imp.clear();
                              dubba.clear();
                            });
                            Navigator.pop(context);
                          },

                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(width: 1),
                          ),
                          child: Text("Assign this quest"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
