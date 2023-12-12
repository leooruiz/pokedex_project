import 'package:flutter/material.dart';

class PokeCard extends StatelessWidget {
  const PokeCard(
      {super.key, required this.name, required this.image, required this.id});
  final String name;
  final String image;
  final int id;

//TODO: PUT NAME, IMAGE AND ID
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          child: Card(
            color: Colors.indigo[600],
            //TODO: MAKE ALL CARDS RESPONSIBLE
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      id.toString().length == 1
                          ? Text(
                              '#000$id',
                              style: const TextStyle(color: Colors.white38),
                            )
                          : id.toString().length == 1
                              ? Text(
                                  '#00$id',
                                  style: const TextStyle(color: Colors.white38),
                                )
                              : id.toString().length == 3
                                  ? Text(
                                      '#0$id',
                                      style: const TextStyle(
                                          color: Colors.white38),
                                    )
                                  : Text(
                                      '#$id',
                                      style: const TextStyle(
                                          color: Colors.white38),
                                    ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(3),
                                width: 50,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'grass',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(3),
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'poison',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ), //TODO: IMAGE
                        // Image.network(image),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'details');
          }),
    );
  }
}
