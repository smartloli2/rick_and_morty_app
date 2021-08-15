import 'package:flutter/material.dart';

@immutable
class NullWidget extends StatelessWidget {
  const NullWidget();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
