import 'package:flutter/material.dart';

class NavBar12Widget extends StatefulWidget {
  NavBar12Widget({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex;
  @override
  _NavBar12WidgetState createState() => _NavBar12WidgetState();
}

class _NavBar12WidgetState extends State<NavBar12Widget> {
  @override
  void initState() {
    if (widget.currentIndex == null) {
      widget.currentIndex = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (widget.currentIndex != 0) {
                        widget.currentIndex = 0;
                      }
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.home_rounded,
                    color: widget.currentIndex == 0
                        ? Colors.black
                        : const Color(0xFF9299A1),
                    size: 24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (widget.currentIndex != 1) {
                        widget.currentIndex = 1;
                      }
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    color: widget.currentIndex == 1
                        ? Colors.black
                        : const Color(0xFF9299A1),
                    size: 24,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Colors.blue),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.currentIndex != 2) {
                      widget.currentIndex = 2;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.graphic_eq,
                    color: widget.currentIndex == 2
                        ? Colors.black
                        : const Color(0xFF9299A1),
                    size: 24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (widget.currentIndex != 3) {
                        widget.currentIndex = 3;
                      }
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Icon(
                    Icons.person_2_outlined,
                    color: widget.currentIndex == 3
                        ? Colors.black
                        : const Color(0xFF9299A1),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
