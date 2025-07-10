import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({
    super.key,
    required this.code,
    this.isTerminalCommand = false,
  });

  final String code;
  final bool isTerminalCommand;

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: SizedBox(
              width: double.infinity,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(
                      widget.isTerminalCommand ? "\$ ${widget.code}" : widget.code,
                      style: TextStyle(fontFamily: "RobotoMono"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 7,
          right: 7,
          child: IconButton(
            onPressed: () => Clipboard.setData(ClipboardData(text: widget.code)),
            icon: Icon(Icons.copy),
            iconSize: 16,
          ),
        ),
      ],
    );
  }
}