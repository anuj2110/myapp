import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(new MyApp());

//Stateless widgets are immutable, meaning that their properties can't change—all values are final.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair =new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
//Prefixing an identifier with an underscore enforces privacy in the Dart language.
class RandomWordsState extends State<RandomWords> {
  @override
  final List<WordPair> _suggestions= <WordPair>[];   
  final TextStyle _biggerFont =  const TextStyle(fontSize: 18.0);
  //RandomWordsState createState() => new RandomWordsState();
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding:const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context,int i){
        if(i.isOdd){
          return new Divider();
        }
        final int index =i~/2;
        if(index>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
   Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
   
}
