import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/home_screen/widgets/item_details_modal.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/screens/widgets/rarity_indicator.dart';
import 'package:comet_rail/services/models/res_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../services/providers/item_data_providers/item_desc_provider.dart';

class ItemTile extends ConsumerWidget {
  final ResItem itemData;
  const ItemTile({super.key, required this.itemData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(itemDescProvider).when(
          data: (data) => ListTile(
            leading: SizedBox(
              width: 50,
              child: CachedNetworkImage(
                imageUrl:
                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${itemData.icon}",
              ),
            ),
            title: Text(
              itemData.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: RarityIndicator(rarity: itemData.rarity),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ItemDetailsModal(itemData: itemData),
              );
            },
          ),
          error: (error, stackTrace) =>
              HttpCallErrorHandler(provider: itemDescProvider),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
