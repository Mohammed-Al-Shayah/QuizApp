import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        elevation: 25,
        child: Column(
          children:  [
             const UserAccountsDrawerHeader(
              accountName: Text(
                'Mohammed AL Shayah',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text('MohammedAlShayah@gmail.com',
                  style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              currentAccountPicture: CircleAvatar(
                    child: const Text('MS'),
                backgroundColor: Colors.pinkAccent,
              ),
            ),
            ListTile(
              leading:const Icon(Icons.edit),
              title:const Text('Create Quiz'),
              onTap: (){
                 Navigator.pushNamed(context, "CreateQuiz");
              },
            ),
            ListTile(
              leading:const Icon(Icons.help_center),
              title:const Text('Start Quiz'),
              onTap: (){
                Navigator.pushNamed(context, "StartQuiz");
              },
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/quiz.png'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "StartQuiz");
                },
                child: const Text("Let's Start!"),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.teal,

              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
