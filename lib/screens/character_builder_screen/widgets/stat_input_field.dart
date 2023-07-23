import 'package:flutter/material.dart';

import '../../../constants/stats.dart';
import 'stat_selector.dart';

class StatInputField extends StatelessWidget {
  final void Function(Stat stat) onStatChange;
  final void Function(String value) onChanged;
  final EdgeInsets padding;
  const StatInputField({
    super.key,
    required this.onStatChange,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          StatSelector(
            onTap: onStatChange,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                hintText: "Enter Stat",
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) => onChanged(v),
            ),
          )),
        ],
      ),
    );
  }
}
