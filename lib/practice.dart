import 'package:flutter/material.dart';

class Week2Practice extends StatelessWidget {
  const Week2Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is Appbar'), // Title of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Column arranges its children vertically.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text widget: Displays a string of text.
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Adds vertical spacing between widgets.

            // Container widget: Can hold a single child and apply padding, margins, borders, and background color.
            Container(
              padding: const EdgeInsets.all(
                  16.0), // Inner padding inside the container.
              margin: const EdgeInsets.symmetric(
                  vertical: 10), // Margin around the container.
              decoration: BoxDecoration(
                color: Colors.blueAccent, // Background color of the container.
                borderRadius: BorderRadius.circular(8), // Rounded corners.
              ),
              // Child of the Container: A Text widget.
              child: const Text(
                'This is a Container',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // Adds vertical spacing.

            // Row widget: Arranges its children horizontally.
            const Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Evenly spaces the icons horizontally.
              children: <Widget>[
                Icon(Icons.star,
                    color: Colors.red, size: 30), // First icon in the row.
                Icon(Icons.star,
                    color: Colors.green, size: 30), // Second icon in the row.
                Icon(Icons.star,
                    color: Colors.blue, size: 30), // Third icon in the row.
              ],
            ),
            const SizedBox(height: 20), // Adds vertical spacing.

            // Column widget: Arranges its children vertically.
            const Column(
              children: <Widget>[
                Icon(Icons.favorite,
                    color: Colors.pink, size: 30), // First icon in the column.
                Icon(Icons.thumb_up,
                    color: Colors.blue, size: 30), // Second icon in the column.
                Icon(Icons.thumb_down,
                    color: Colors.yellow,
                    size: 30), // Third icon in the column.
              ],
            ),
            const SizedBox(height: 20), // Adds vertical spacing.

            // Image widget: Displays an image from a network URL.
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              height: 100, // Height of the image.
            ),
            const SizedBox(height: 20), // Adds vertical spacing.

            // ElevatedButton widget: A button that the user can press.
            ElevatedButton(
              onPressed: () {
                // Action when button is pressed.
                print('Elevated Button Pressed');
              },
              child: Text('Elevated Button'), // Text displayed on the button.
            ),
            const SizedBox(height: 10), // Adds vertical spacing.

            // TextButton widget: A button with flat design.
            TextButton(
              onPressed: () {
                // Action when button is pressed.
                print('Text Button Pressed');
              },
              child: Text('Text Button'), // Text displayed on the button.
            ),
            const SizedBox(height: 20), // Adds vertical spacing.

            // TextField widget: A field where the user can type.
            const TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the text field.
                labelText: 'Enter your name', // Placeholder label text.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
