import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Color mainColor = const Color(0xFF181B20);
  @override
  void initState() {
    super.initState();
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
            '모니터링',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Container(
                    width: 324,
                    height: 169,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/bed.png'),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 18),
                              child: SvgPicture.asset(
                                'assets/images/temp.svg',
                                width: 32, // 이미지 크기
                                height: 32,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              child: Text('23˚C',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          left: 20,
                          bottom: 18,
                          child: Text('침실',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(height: 24),
                Container(
                    width: 324,
                    height: 169,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/liv.png'),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 18),
                              child: SvgPicture.asset(
                                'assets/images/temp.svg',
                                width: 32, // 이미지 크기
                                height: 32,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              child: Text('25˚C',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          left: 20,
                          bottom: 18,
                          child: Text('거실',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 24),
                Container(
                    width: 324,
                    height: 169,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/room.png'),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 18),
                              child: SvgPicture.asset(
                                'assets/images/temp.svg',
                                width: 32, // 이미지 크기
                                height: 32,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              child: Text('22˚C',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          left: 20,
                          bottom: 18,
                          child: Text('방1',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 24),
                Container(
                  width: 324,
                  height: 169,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/bath.png'),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 18),
                            child: SvgPicture.asset(
                              'assets/images/temp.svg',
                              width: 32, // 이미지 크기
                              height: 32,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5, top: 20),
                            child: Text('26˚C',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 18,
                        child: Text('욕실',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
      ),
    );
  }
}