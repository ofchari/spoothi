import 'package:flutter/material.dart';

class ExpandableFabExample extends StatefulWidget {
  @override
  _ExpandableFabExampleState createState() => _ExpandableFabExampleState();
}

class _ExpandableFabExampleState extends State<ExpandableFabExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationIcon;
  late Animation<double> _animationTranslate;
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationTranslate =
        Tween<double>(begin: 56.0, end: 0.0).animate(_animationController);
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable FAB Example"),
      ),
      body: Center(
        child: Text("Your content goes here"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildExpandableFab(
            Icons.edit,
                () {
              // Handle action for the first button
            },
          ),
          SizedBox(height: 16),
          _buildExpandableFab(
            Icons.delete,
                () {
              // Handle action for the second button
            },
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
                if (isExpanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            tooltip: 'Toggle',
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableFab(IconData iconData, VoidCallback onPressed) {
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        _animationTranslate.value * (_animationIcon.value - 1),
        0.0,
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: Icon(iconData),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ExpandableFabExample(),
//   ));
