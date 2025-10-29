import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/image_generator.bloc.dart';
import '../blocs/events_and_states.dart';

class ResultScreen extends StatefulWidget {

  final String prompt;

  const ResultScreen({required this.prompt, super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final ImageGeneratorBloc _bloc;

  @override  void initState() {
    super.initState();
    _bloc = ImageGeneratorBloc();
    _bloc.add(ImageLoadRequested(widget.prompt));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: BlocBuilder<ImageGeneratorBloc, ImageState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is ImageInitial || state is ImageLoading) {
                return CircularProgressIndicator();
              } else if (state is ImageLoaded) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(state.image),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () => _retry(), child: const Text('Try Another')),
                        OutlinedButton(onPressed: () => _newPrompt(), child: const Text('New Prompt'))
                      ],
                    )
                  ],
                );
              } else if (state is ImageError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Something went wrong. Please try again.'),
                    ElevatedButton(onPressed: () => _retry(), child: const Text('Retry'))
                  ],
                );
              }
              return Container();
            },
          )
        ),
      ),
    );
  }

  void _retry() {
    _bloc.add(ImageLoadRequested(widget.prompt));
  }

  void _newPrompt() {
    context.go('/');
  }
}