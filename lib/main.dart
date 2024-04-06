import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 14, 64, 104)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Seettu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   leading: const Icon(Icons.person_3,size: 50.0,),
      //   title: const Column(

      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text("Welcome",
      //     style: TextStyle(color: Colors.grey , fontSize: 16.0,fontWeight: FontWeight.w700),),
      //     Text("Gowri Prasath S", style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),)
      //   ],
      //           )
      // ),
      body: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(4.0, 12.0, 0.0, 0.0),
                      child: const Icon(
                        Icons.person_3,
                        size: 50.0,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(3.0, 10.0, 0.0, 0.0),
                      child: const Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                      child: const Text(
                        "Gowri Prasath S",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ]),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 14.0, 4.0, 0.0),
                    child: const Icon(
                      Icons.notifications,
                      size: 40.0,
                    ),
                  )
                ],
              )
            ]),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5.0, 20.0, 20.0, 20.0),
              child: const Icon(
                Icons.my_library_add,
                size: 40.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 400.0,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, position) {
              return Card(
                key: ValueKey(position),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    position.toString(),
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

Widget yourListChild() {
  return const Text("Hello everyone!!");
}
