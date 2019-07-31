import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: Feedings()
    );
  }
}

class FeedingsState extends State<Feedings> {
final _feedings = List<Feeding>.generate(
  20,
  (i) => Feeding(
        'Feeding $i',
        'About this feeding $i',
      ),
);
final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Biznass'),
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ]
      ),
      body: _buildFeedingList(),
    );
  }

  Widget _buildFeedingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        // Lazy load
        // if (index >= _feedings.length) {
        //  _feedings.addAll(generateWordPairs().take(10));
        // }
        return _buildRow(_feedings[index]);
      }, 
      itemCount: _feedings.length * 2);
  }

  Widget _buildRow(Feeding feeding) {
    return ListTile(
      title: Text(
        feeding.title,
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.arrow_right,
      ),
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => FeedingDetailScreen(feeding: feeding),
          ),
        );
      },
    );
  }

  void getNextFeedings() {
  }
}

class Feedings extends StatefulWidget {
  @override
  FeedingsState createState() => FeedingsState();
}

class Feeding {
  final String title;
  final String description;

  Feeding(this.title, this.description);
}

class FeedingDetailScreen extends StatelessWidget {
  final Feeding feeding;

  FeedingDetailScreen({Key key, @required this.feeding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feeding.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(feeding.description),
      ),
    );
  }
}