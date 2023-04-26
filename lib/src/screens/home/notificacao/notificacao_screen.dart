import 'package:flutter/material.dart';

class NotificacaoScreen extends StatefulWidget {
  const NotificacaoScreen({super.key});

  @override
  State<NotificacaoScreen> createState() => _NotificacaoScreenState();
}

class _NotificacaoScreenState extends State<NotificacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.purple,
      ),
    );
  }
}
