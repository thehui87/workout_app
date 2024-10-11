import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClickableCard extends StatefulWidget {
  final String name;
  final IconData? icon; // Make this nullable
  final String? imageUrl; // Make this nullable
  final VoidCallback onTap;
  final VoidCallback? onLongPress; // Optional long press callback

  const ClickableCard({
    super.key,
    required this.name,
    this.icon,
    this.imageUrl,
    required this.onTap,
    this.onLongPress,
  });

  @override
  ClickableCardState createState() => ClickableCardState();
}

class ClickableCardState extends State<ClickableCard> {
  Color _color = Colors.white;
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _color = Colors.grey.shade300; // Change color on tap down
      _scale = 0.95; // Scale down for visual feedback
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _color = Colors.white; // Reset color on tap up
      _scale = 1.0; // Reset scale
    });
  }

  void _onTapCancel() {
    setState(() {
      _color = Colors.white; // Reset color if the tap is canceled
      _scale = 1.0; // Reset scale
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        widget.onTap();
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Display icon or image
              if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8.0), // Inner padding
                  child: SvgPicture.asset(
                    widget.imageUrl!,
                    // width: 40, // Adjust width and height as needed
                    height: 40,
                    fit: BoxFit.cover, // Use BoxFit to cover the circle
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                )
              else
                Icon(widget.icon, size: 40),
              const SizedBox(width: 16),
              // Display name
              Expanded(
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
