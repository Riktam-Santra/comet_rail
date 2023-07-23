import 'package:flutter/material.dart';

import '../../../constants/stats.dart';

class StatSelector extends StatefulWidget {
  final void Function(Stat stat) onTap;
  const StatSelector({
    super.key,
    required this.onTap,
  });

  @override
  State<StatSelector> createState() => _StatSelectorState();
}

class _StatSelectorState extends State<StatSelector> {
  Stat initialStat = StatList().stats[0];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Chip(
        label: Text(initialStat.shortName),
        shape: const StadiumBorder(),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Choose a Stat",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: StatList().stats.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                StatList().stats[index].name,
                              ),
                              onTap: () {
                                setState(() {
                                  initialStat = StatList().stats[index];
                                });
                                widget.onTap(
                                  StatList().stats[index],
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
