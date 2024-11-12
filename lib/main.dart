import 'package:flutter/material.dart';

void main() {
  runApp(ListGrid());
}

class ListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List and Grid View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListGridHomePage(),
    );
  }
}

class ListGridHomePage extends StatefulWidget {
  @override
  _ListGridHomePageState createState() => _ListGridHomePageState();
}

class _ListGridHomePageState extends State<ListGridHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView & GridView View'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: "Item X"),
              Tab(icon: Icon(Icons.grid_on), text: "Grid X"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ListView Tab
            ListViewTab(),
            // GridView Tab
            GridViewTab(),
          ],
        ),
      ),
    );
  }
}

class ListViewTab extends StatelessWidget {
  List<String> items = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.label),
          title: Text(items[index]),
          subtitle: Text("Item $index"),
        );
      },
    );
  }
}

class GridViewTab extends StatelessWidget {
   List<String> items = List<String>.generate(20, (index) => "Grid $index");

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(items.length, (index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              items[index],
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      }),
    );
  }
}
