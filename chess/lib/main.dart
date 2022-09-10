import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppbar(
          title: 'Chess',
          context: context,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: SafeArea(child: buildGridViewChess()),
      ),
    );
  }
}

Widget buildGridViewChess() {
  return Container(
    alignment: Alignment.center,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: 1,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        //final rows = index;
        //final columns = index ~/ 8;
        final rows = (index) ~/ 8 + 1;
        final columns = index % 8 + 1;

        if (rows % 2 == 0) {
          if (columns % 2 != 0) {
            return blackBox(rows, columns);
          }
        } else {
          if (columns % 2 == 0) {
            return blackBox(rows, columns);
          }
        }
        return whileBox(rows, columns);
      },
      itemCount: 64,
    ),
  );
}

// Widget buildItem({required int index}) {
//   return Container(
//     alignment: Alignment.center,
//     child: Text('${index + 1}'),
//   );
// }

Widget blackBox(int rows, int columns) {
  return Container(
    color: Colors.black,
    alignment: Alignment.center,
    child: Text(
      '$rows:$columns',
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget whileBox(int rows, int columns) {
  return Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: Text(
      '$rows:$columns',
      style: const TextStyle(color: Colors.black),
    ),
  );
}

AppBar buildAppbar({
  required String title,
  required BuildContext context,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.deepPurpleAccent,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.orange, fontSize: 25, fontWeight: FontWeight.bold),
    ),
    actions: actions,
  );
}
