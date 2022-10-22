import 'package:flutter/material.dart';

import '../theme.dart';

class LandingDisplay extends StatefulWidget {
  DecorationImage? backgroundimg;
  LandingDisplay({super.key, this.backgroundimg});

  @override
  State<LandingDisplay> createState() => _LandingDisplayState();
}

class _LandingDisplayState extends State<LandingDisplay> {
  late Image logo;

  @override
  void initState() {
    super.initState();
    logo = Image.asset(
      "assets/images/togandtrimlogo.png",
      scale: 3.5,
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(logo.image, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [logo],
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(image: widget.backgroundimg),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "A VISION FOR SUSTAINABILITY & COMFORT",
                    style: TextStyle(
                        color: landingpagetextcolor,
                        fontSize: 35,
                        fontFamily: "buttershine"),
                  ),
                  const Text(
                    "Presenting Tog And Trim Collection",
                    style: TextStyle(
                        color: landingpagetextcolor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "poppins"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      hoverColor: landingpagetextcolor,
                      child: Container(
                        color: Colors.black,
                        height: 60,
                        width: 300,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Explore the Store",
                              style: TextStyle(
                                  color: landingpagetextcolor,
                                  fontSize: 20,
                                  fontFamily: "buttershine"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
