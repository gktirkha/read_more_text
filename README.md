# ReadMoreText

`ReadMoreText` is a Flutter widget that allows you to display long text with a "Read more" or "Show less" feature. This widget truncates the text to a specified number of lines and provides a way to expand or collapse the text, making it ideal for handling lengthy content in a user-friendly manner.

## Features

- Display long text with a truncation feature.
- Customizable "Show more" and "Show less" labels.
- Support for custom text styles and link styles.
- Adjustable maximum width and maximum lines.

> If you prefer, You may find the dart-doc version of the documentation [here](https://gktirkha.github.io/flutter_packages_doc/read_more_text/)

## Installation

Add `read_more_text` to your `pubspec.yaml` file:

```yaml
dependencies:
  read_more_text:
    git: https://github.com/gktirkha/read_more_text
```

# Usage
To use the ReadMoreText widget, simply include it in your widget tree and configure it with the desired properties.

```dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ReadMoreTextState> key = GlobalKey<ReadMoreTextState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ReadMoreText(
              key: key,
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              maxLines: 1,
              showMoreLabel: '... Read more',
              showLessLabel: 'Show less',
              textStyle: const TextStyle(fontSize: 16),
              linkTextStyle: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  log(key.currentState!.isExpanded.toString());
                },
                child: const Text("hello"))
          ],
        ),
      ),
    );
  }
}

```


# Properties

| Property         | Type         | Description                                                                                   | Default Value    |
|------------------|--------------|-----------------------------------------------------------------------------------------------|------------------|
| `text`           | `String`     | The text content to display.                                                                  | -                |
| `maxLines`       | `int`        | The maximum number of lines to display when collapsed.                                        | `2`              |
| `textStyle`      | `TextStyle?` | The style of the text content.                                                                | `null`           |
| `showMoreLabel`  | `String`     | The label for the "Show more" link.                                                           | `'Show more'`    |
| `showLessLabel`  | `String`     | The label for the "Show less" link.                                                           | `'Show less'`    |
| `linkTextStyle`  | `TextStyle?` | The style of the "Show more" and "Show less" links.                                           | `null`           |


# Customization

| Customization    | Description                                                                                           | Example                                                      |
|------------------|-------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| **Text Style**   | Customize the appearance of the text content using the `textStyle` property.                          | `TextStyle(fontSize: 16)`                                    |
| **Link Style**   | Customize the appearance of the "Show more" and "Show less" links using the `linkTextStyle` property. | `TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)` |
| **Labels**       | Customize the labels for expanding and collapsing the text using `showMoreLabel` and `showLessLabel`. | `showMoreLabel: 'Read more', showLessLabel: 'Show less'`     |

# Contributions
Contributions are welcome! Please submit issues and pull requests on the [GitHub repository.](https://github.com/gktirkha/read_more_text)

# License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
