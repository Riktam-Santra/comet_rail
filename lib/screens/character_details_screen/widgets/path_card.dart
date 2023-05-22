import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/paths_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PathCard extends ConsumerWidget {
  final String path;
  const PathCard({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(pathsDataProvider).when(
          data: (data) {
            final url =
                "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${data[path]!.name.replaceAll("The ", "")}.png";

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ImageIcon(
                        CachedNetworkImageProvider(
                          url,
                        ),
                        size: 50,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[path]!.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(data[path]!.desc),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) =>
              HttpCallErrorHandler(provider: pathsDataProvider),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
