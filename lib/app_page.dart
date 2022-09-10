import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordPage extends StatelessWidget {
  const RandomWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: Text(toString())),
      body: RandomWordInfiniteList(),
    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  var wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() => wordPair = WordPair.random()),
      child: Text(
        wordPair.asPascalCase,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class RandomWordList extends StatelessWidget {
  const RandomWordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(8.0),
      children: List.filled(
          // generate list items of given number
          20,
          Column(
            children: const [
              ListTile(
                title: RandomWord(),
              ),
              Divider(),
            ],
          )),
    );
  }
}

class RandomWordInfiniteList extends StatefulWidget {
  const RandomWordInfiniteList({Key? key}) : super(key: key);

  @override
  State<RandomWordInfiniteList> createState() => _RandomWordInfiniteListState();
}

class _RandomWordInfiniteListState extends State<RandomWordInfiniteList> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );

          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
    // setState(() {
    //   _saved.clear();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final isAlreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              isAlreadySaved ? Icons.favorite : Icons.favorite_border,
              color: isAlreadySaved ? Colors.red : null,
              semanticLabel: isAlreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (isAlreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}
