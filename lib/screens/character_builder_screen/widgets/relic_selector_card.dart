import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/character_builder_screen/widgets/stat_input_field.dart';
import 'package:comet_rail/services/models/selected_relic_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_builder_selected_data_provider.dart';
import '../screens/relic_selector_screen.dart';

class RelicSelectorCard extends StatelessWidget {
  final int index;
  const RelicSelectorCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final builderData = ref.watch(characterBuilderSelectedDataProvider);
        SelectedRelicData? data;
        switch (index) {
          case 0:
            data = builderData.selectedRelic.first;
          case 1:
            data = builderData.selectedRelic.second;
          case 2:
            data = builderData.selectedRelic.third;
          case 3:
            data = builderData.selectedRelic.fourth;
          default:
            data = builderData.selectedRelic.first;
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: data != null
                ? InkWell(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master///${data.relic.icon}",
                              height: 80,
                              width: 80,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data.relic.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Main Stat"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 8, right: 15),
                          child: Column(
                            children: [
                              StatInputField(
                                onStatChange: (stat) {},
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 15, right: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Sub Stats"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 8, right: 15),
                          child: Column(
                            children: [
                              StatInputField(
                                onStatChange: (stat) {},
                                onChanged: (value) {},
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: StatInputField(
                                  onStatChange: (stat) {},
                                  onChanged: (value) {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: StatInputField(
                                  onStatChange: (stat) {},
                                  onChanged: (value) {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: StatInputField(
                                  onStatChange: (stat) {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelicSelectorScreen(
                          relicIndex: index,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.add,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Select a Relic",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelicSelectorScreen(
                          relicIndex: index,
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
