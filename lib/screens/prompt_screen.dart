import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Describe what you want to see...',
                ),
                onChanged: (value) => setState(() {}),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: textController.text.isEmpty ? null : () => _onSubmit(textController.text.trim()),
                child: const Text('Generate'),
              ),
            ],
          ),
        )
      ),
    );
  }

  void _onSubmit(String prompt) {
    if (prompt.isEmpty) return;
    context.go('/result/$prompt');
  }
}