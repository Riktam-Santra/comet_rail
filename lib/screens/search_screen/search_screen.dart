import 'dart:async';

import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/search_helper_providers/search_result_state_provider.dart';
import 'package:comet_rail/services/providers/search_helper_providers/search_value_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  SearchScreen({super.key});
  final SearchController controller = SearchController();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late ScrollController _scrollController;
  Timer? searchOnStoppedTyping;

  late FocusNode searchBarFocusNode;

  _onChangeHandler(value) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    }
    setState(
      () => searchOnStoppedTyping = Timer(
        duration,
        () => ref.read(searchValueStateProvider.notifier).setValue(value),
      ),
    );
  }

  @override
  void initState() {
    searchBarFocusNode = FocusNode();
    searchBarFocusNode.requestFocus();

    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    searchBarFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // SearchBar(
            //   // focusNode: searchBarFocusNode,
            //   // controller: widget.controller,
            //   hintText: "Search for anything in game",
            //   onChanged: (value) => searchValue = value,
            //   trailing: [
            //     IconButton(
            //       icon: const Icon(Icons.search),
            //       onPressed: () {
            //         ref
            //             .read(searchValueStateProvider.notifier)
            //             .setValue(searchValue);

            //         searchBarFocusNode.unfocus();
            //       },
            //     ),
            //   ],
            // ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search for anything in game...",
                  ),
                  onSubmitted: (value) => ref
                      .read(searchValueStateProvider.notifier)
                      .setValue(value),
                ),
              ),
            ),
            ref.watch(searchResultProvider).when(
                  data: (data) {
                    if (data == null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 50,
                        ),
                        child: Center(
                          child: Text(
                            "Search for something to get started...",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      );
                    } else {
                      final widgetList = [
                        if (data.characterSearchResults == null ||
                            data.characterSearchResults!.isEmpty)
                          Container()
                        else
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "Characters",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ...data.characterSearchResults ?? [],
                        if (data.itemSearchResults == null ||
                            data.itemSearchResults!.isEmpty)
                          Container()
                        else
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "Items",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ...data.itemSearchResults ?? [],
                        if (data.lightConeSearchResults == null ||
                            data.lightConeSearchResults!.isEmpty)
                          Container()
                        else
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "Light Cones",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ...data.lightConeSearchResults ?? [],
                        if (data.relicSearchResults == null ||
                            data.relicSearchResults!.isEmpty)
                          Container()
                        else
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "Relics",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ...data.relicSearchResults ?? [],
                      ];
                      return ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: widgetList.length,
                        itemBuilder: (context, index) => widgetList[index],
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return HttpCallErrorHandler(
                      provider: searchResultProvider,
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
          ],
        ),
      ),
    ));
  }
}
