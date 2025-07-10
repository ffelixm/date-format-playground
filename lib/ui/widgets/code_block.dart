import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({
    super.key,
    required this.code,
  });

  final String code;

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
                  child: SelectableText(
                    widget.code,
                    style: TextStyle(fontFamily: "RobotoMono"),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            onPressed: () => Clipboard.setData(ClipboardData(text: widget.code)),
            icon: Icon(Icons.copy),
            iconSize: 18,
          ),
        ),
      ],
    );
  }
}