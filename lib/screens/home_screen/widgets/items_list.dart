import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemsList extends ConsumerWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: const Image(
            image: AssetImage("sample_assets/item.png"),
          ),
          title: const Text("Stelar Jade"),
          subtitle: const Text("In-game currency"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          // tileColor: Color.fromARGB(255, 254, 247, 255),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage("sample_assets/item2.png"),
          ),
          title: const Text("Stelar Jade"),
          subtitle: const Text("In-game currency"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          // tileColor: Color.fromARGB(255, 254, 247, 255),
        ),
        ListTile(
          leading: const Image(
            image: AssetImage("sample_assets/item3.png"),
          ),
          title: const Text("Stelar Jade"),
          subtitle: const Text("In-game currency"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          // tileColor: Color.fromARGB(255, 254, 247, 255),
        ),
      ],
    );
  }
}
