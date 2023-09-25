import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wimonsiri Klinkasorn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '6414421007',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          child: Text(
            'Next to',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );

    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Im proud of myself for being a smart person.'
        'I am a smart person and learn new things quickly'
        'I am a creative person and always come up with new ideas.'
        'I am a kind person and help others.'
        'I am a happy person and enjoy life',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Work07'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://i.pinimg.com/originals/8e/38/85/8e38857bc0aae5c048f1a8099867527c.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              ('https://th.bing.com/th/id/OIP.-Nyuw-lzGVcD6PrEXTXp8AHaEK?pid=ImgDet&rs=1'),
              width: 400,
              height: 400,
            ),
            const Text(
              'วิมลสิริ กลิ่นเกษร',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GridListScreen()),
                );
              },
              child: const Text('Grid List'),
            ),
          ],
        ),
      ),
    );
  }
}

class GridListScreen extends StatelessWidget {
  const GridListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid List'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blueGrey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.harpersbazaararabia.com/public/images/2019/04/09/Untitled-design-(1)_1.png${index + 1}.jpg',
                    width: 500,
                    height: 500,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Box ${index + 1}',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
