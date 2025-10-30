import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/utils/extensions.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({
    super.key,
    required this.onSend,
    required this.isLoading,
  });

  final Function(String) onSend;
  final bool isLoading;

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _canSend = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_canSend) {
      widget.onSend(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Sizes.p4,
      child: Container(
        padding: const EdgeInsets.all(Sizes.p8),
        decoration: BoxDecoration(
          color: context.color.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(Sizes.p32),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: context.loc.aiInputHint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p16,
                  ),
                ),
                onSubmitted: (_) => _handleSend(),
              ),
            ),
            IconButton(
              icon: _canSend ? const Icon(Icons.send) : const Icon(Icons.mic),
              onPressed: widget.isLoading
                  ? null
                  : _canSend
                  ? _handleSend
                  : null, // Mic functionality disabled for now
            ),
          ],
        ),
      ),
    );
  }
}
