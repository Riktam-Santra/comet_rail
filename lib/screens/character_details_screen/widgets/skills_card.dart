import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/models/character_skills.dart';
import 'package:comet_rail/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_data_providers/character_skills_data_provider.dart';

class SkillsCard extends ConsumerWidget {
  final List<String> skillIds;
  const SkillsCard({super.key, required this.skillIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(characterSkillsDataProvider).when(
          data: (data) {
            final List<CharacterSkill> skillShortList = [];

            for (final x in skillIds) {
              if (data[x] != null) {
                skillShortList.add(data[x]!);
              }
            }

            for (final x in skillShortList) {
              log(x.name);
            }
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Skills",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Column(
                          children: [
                            for (final skill in skillShortList)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageIcon(
                                      CachedNetworkImageProvider(
                                          "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${skill.icon}"),
                                      size: 50,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              skill.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Utils.convertSkillType(
                                                        skill.type) ==
                                                    ""
                                                ? Container()
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                    ),
                                                    child: Text(
                                                        Utils.convertSkillType(
                                                            skill.type)),
                                                  ),
                                            Text(
                                              Utils.parseGeneralStatInDesc(
                                                  skill.desc.replaceAll(
                                                      RegExp(r'\\n'), "\n"),
                                                  skill.params),
                                            ),
                                            const Divider(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        )
                      ],
                    )),
              ),
            );
          },
          error: (error, stackTrace) {
            return HttpCallErrorHandler(
              provider: characterSkillsDataProvider,
            );
          },
          loading: () => const CircularProgressIndicator(),
        );
  }
}
