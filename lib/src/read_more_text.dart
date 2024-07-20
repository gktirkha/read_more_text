import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A widget that displays text with a "read more" and "read less" feature.
class ReadMoreText extends StatefulWidget {
  /// Creates a [ReadMoreText] widget.
  ///
  /// The [text] parameter must not be null.
  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.textStyle,
    this.showMoreLabel = 'Show more',
    this.showLessLabel = 'Show less',
    this.linkTextStyle,
    this.onChange,
  });

  /// The text to display in the widget.
  final String text;

  /// The maximum number of lines to display before truncating.
  ///
  /// Defaults to 2.
  final int maxLines;

  /// The style to use for the text.
  final TextStyle? textStyle;

  /// The label for the "show more" link.
  ///
  /// Defaults to 'Show more'.
  final String showMoreLabel;

  /// The label for the "show less" link.
  ///
  /// Defaults to 'Show less'.
  final String showLessLabel;

  /// The style to use for the "show more" and "show less" links.
  final TextStyle? linkTextStyle;

  /// A callback that is called when the "show more" or "show less" link is tapped.
  ///
  /// The callback receives a boolean indicating whether the text is expanded.
  final Function(bool)? onChange;

  @override
  State<ReadMoreText> createState() => ReadMoreTextState();
}

/// The state for a [ReadMoreText] widget.
class ReadMoreTextState extends State<ReadMoreText> {
  /// Whether the text is currently expanded.
  bool get isExpanded => _isExpanded;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        TextSpan textSpan = TextSpan(
          text: widget.text,
          style: widget.textStyle,
        );

        TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        if (!textPainter.didExceedMaxLines) {
          return RichText(
            text: textSpan,
          );
        }

        final linkText =
            _isExpanded ? widget.showLessLabel : widget.showMoreLabel;
        final linkTextStyle = widget.linkTextStyle ??
            const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            );

        TextPainter linkTextPainter = TextPainter(
          text: TextSpan(text: linkText, style: linkTextStyle),
          textDirection: TextDirection.ltr,
        )..layout();

        final double linkWidth =
            linkTextPainter.width + max(linkText.length / 2, 16);

        textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth - linkWidth);

        final endIndex = textPainter
            .getPositionForOffset(
              Offset(constraints.maxWidth - linkWidth, textPainter.size.height),
            )
            .offset;

        final visibleText = widget.text.substring(0, endIndex);

        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: _isExpanded ? widget.text : '$visibleText ',
                style: widget.textStyle,
              ),
              TextSpan(
                text: linkText,
                style: linkTextStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                    if (widget.onChange != null) widget.onChange!(_isExpanded);
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
