import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/screens/widgets/rarity_indicator.dart';
import 'package:comet_rail/services/models/res_item.dart';
import 'package:comet_rail/services/providers/item_desc_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemDetailsModal extends StatefulWidget {
  final ResItem itemData;
  const ItemDetailsModal({super.key, required this.itemData});

  @override
  State<ItemDetailsModal> createState() => _ItemDetailsModalState();
}

class _ItemDetailsModalState extends State<ItemDetailsModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        animationController: _animationController,
        onClosing: () => {},
        builder: (context) {
          return Consumer(
            builder: (context, ref, child) => ref.watch(itemDescProvider).when(
                  data: (data) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${widget.itemData.icon}",
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.itemData.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      RarityIndicator(
                                          rarity: widget.itemData.rarity),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(data[widget.itemData.name]
                                      ?.desc
                                      .replaceAll(RegExp(r'<[^>]*>'), "") ??
                                  'There is no description provided for this item.'),
                            ),
                          ),
                          Text(data[widget.itemData.name]
                                  ?.lore
                                  .replaceAll("<br />", "\n") ??
                              '')
                        ],
                      ),
                    ),
                  ),
                  error: (error, stackTrace) =>
                      HttpCallErrorHandler(provider: itemDescProvider),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
