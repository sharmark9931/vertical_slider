import 'package:flutter/material.dart';
import 'package:vertical_slider/custom_slider_track_shape.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        appBar: AppBar(title: const Text('Vertical Slider Demo')),
        body: const Center(child: VerticalSlider()),
      ),
    );
  }
}

class VerticalSlider extends StatelessWidget {
  const VerticalSlider({super.key});

  final double sliderWidth = 84;
  final double sliderHeight = 330;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: SizedBox(
        width: sliderHeight,
        height: sliderWidth,
        child: VerticalSliderPainter(trackHeight: sliderWidth),
      ),
    );
  }
}

class VerticalSliderPainter extends StatefulWidget {
  final double trackHeight;

  const VerticalSliderPainter({super.key, this.trackHeight = 60});

  @override
  State<VerticalSliderPainter> createState() => _VerticalSliderPainterState();
}

class _VerticalSliderPainterState extends State<VerticalSliderPainter> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: widget.trackHeight,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: SliderComponentShape.noThumb,
        trackShape: CustomSliderTrackShape(),
      ),
      child: Slider(
        value: sliderValue,
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        inactiveColor: Colors.transparent,
      ),
    );
  }
}
