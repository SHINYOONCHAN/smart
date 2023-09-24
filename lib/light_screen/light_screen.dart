import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  LightScreenState createState() => LightScreenState();
}

class LightScreenState extends State<LightScreen> {
  Color mainColor = const Color(0xFF181B20);
  double _volumeValue = 0;
  double _opacityValue = 0.6;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;

      if (_volumeValue <= 0){
        _opacityValue = 0;
      } else if (_volumeValue >= 60){
        _opacityValue = 0.7;
      }
      else {
        _opacityValue = _volumeValue / 100;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    onVolumeChanged(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        titleSpacing: 18,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            '방1',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 33, top: 20),
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  height: MediaQuery.of(context).size.height * 0.31,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(204, 202),
                    ),
                  ),

                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Center(
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: -1,
                                maximum: 100,
                                startAngle: 120,
                                endAngle: 60,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 1.0,
                                axisLineStyle: const AxisLineStyle(
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Color(0xff252932),
                                  thickness: 7,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: _volumeValue,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 7,
                                    sizeUnit: GaugeSizeUnit.logicalPixel,
                                    color: Colors.white,
                                  ),
                                  MarkerPointer(
                                    value: _volumeValue,
                                    enableDragging: true,
                                    onValueChanged: onVolumeChanged,
                                    markerHeight: 20,
                                    markerWidth: 20,
                                    markerType: MarkerType.circle,
                                    borderWidth: 2,
                                    borderColor: const Color(0xff181B20),
                                    color: Colors.white,
                                  ),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    angle: 40,
                                    axisValue: 5,
                                    positionFactor: 0.1,
                                    widget: Text(
                                      '${_volumeValue.ceil()}%',
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 40,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 40,
                        child: Container(
                            width: 160,
                            height: 160,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    shape:BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(blurRadius: 25, spreadRadius: 1, color: Color.fromRGBO(255, 255, 255, _opacityValue))
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            MyElevatedButton(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.075,
              backgroundColor: const Color(0xff252932),
              onPressed: () {
                onVolumeChanged(0);
              },
              borderRadius: BorderRadius.circular(100),
              child: SvgPicture.asset(
                'assets/images/power.svg',
                width: 36, // 이미지 크기
                height: 36,
              ),
            ),

            const SizedBox(height: 8),
            const Text(
              '전원',
              style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Pretendard'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Color color;
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Decoration decoration;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.decoration = const BoxDecoration(),
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.color = Colors.transparent,
    this.backgroundColor = Colors.transparent,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

