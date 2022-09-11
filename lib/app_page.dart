import 'package:flutter/material.dart';
import 'package:flutter_sample_app/config/constants.dart';
import 'package:flutter_sample_app/config/size_config.dart';

class LayoutCardList extends StatelessWidget {
  const LayoutCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: ListView(
        children: const [
          LayoutCard(),
          LayoutCard(),
        ],
      ),
    );
  }
}

class LayoutCard extends StatelessWidget {
  const LayoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  // style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          const Text('42'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.blue, Icons.route, 'ROUTE'),
        _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            IMAGE_PATH,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          // const TitleRow(),
          // const ButtonRow(),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: getWidth(14),
        padding: EdgeInsets.all(getWidth(1)),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  const TitleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Oeschinen Lake Campground',
                style: Theme.of(context).textTheme.headline4,
                // TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18,
                // ),
              ),
              const Text('Kandersteg, Switzerland')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.star,
                color: Colors.deepOrange,
              ),
              Text('42'),
            ],
          ),
        )
      ],
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Column(
        //   children: const [
        //     Icon(
        //       Icons.call,
        //       color: Colors.blue,
        //     ),
        //     Text(
        //       'CALL',
        //       style: TextStyle(
        //         color: Colors.blue,
        //       ),
        //     ),
        //   ],
        // ),
        Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.call, color: Colors.blue),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: const Text(
                'CALL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.route,
              color: Colors.blue,
            ),
            Text(
              'ROUTE',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.share,
              color: Colors.blue,
            ),
            Text(
              'SHARE',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
