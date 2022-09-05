import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../secoundScreen.dart';
import 'fistScreen.dart';

class DashboardScreen extends StatelessWidget {
  var data;

  Future<List<dynamic>> getJobsData() async {
    String url = 'https://api.coincap.io/v2/assets';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(response.body);
    return json.decode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: FutureBuilder<List<dynamic>>(
            future: getJobsData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data![index]['id'] +
                              " " +
                              snapshot.data![index]['supply'],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      );
                      // return Text(snapshot.data![index]['id']);
                    });
              }
              return const CircularProgressIndicator();
            }),
      ),

      // left navigationn work
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Parmit malik"),
              accountEmail: Text("test@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.blue
                        : Colors.white,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fistScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add_outlined),
              title: const Text('Add Notes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium_outlined),
              title: const Text('Primium'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.plagiarism_outlined),
              title: const Text('Doc'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: const Text('Updates '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notification_add_outlined),
              title: const Text("Notification"),
              onTap: () {},
            )
          ],
        ),
      ),
      // bottom navigatiob
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
                child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const fistScreen()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecoundScreen()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
