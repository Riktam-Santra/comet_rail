import 'package:flutter/material.dart';

class RelicCard extends StatelessWidget {
  const RelicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 80,
                  child: Image(image: AssetImage("sample_assets/relic.png")),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Relic name",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Spacer(),
                FilledButton(onPressed: () {}, child: const Text("View"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
