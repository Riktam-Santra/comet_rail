import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HttpCallErrorHandler extends ConsumerWidget {
  final FutureProvider provider;
  const HttpCallErrorHandler({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text("Something went wrong."),
          FilledButton(
            onPressed: () => ref.refresh(provider),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
