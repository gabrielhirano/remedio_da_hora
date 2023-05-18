import 'package:flutter/material.dart';

class ProgressoScreen extends StatefulWidget {
  const ProgressoScreen({super.key});

  @override
  State<ProgressoScreen> createState() => _ProgressoScreenState();
}

class _ProgressoScreenState extends State<ProgressoScreen> {
  @override
  Widget build(BuildContext context) {
        return const Center(
      child: Text('In progress'),
    );
  }
}