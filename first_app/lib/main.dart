import 'package:flutter/material.dart';

class MyCustomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem =
        1.0; // Assuming a default value for fem, you should replace this with your actual value
    double ffem =
        1.0; // Assuming a default value for ffem, you should replace this with your actual value

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff101d2c),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // rectangle1Mew (179:29)
                width: double.infinity,
                height: 89 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffc69963),
                ),
              ),
              Container(
                // autogroupbtvdtum (W7gTqZEdRXqhM49FhwbtVD)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 23 * fem),
                padding:
                    EdgeInsets.fromLTRB(19 * fem, 56 * fem, 12 * fem, 74 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("../assets/house-1.jpeg"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // logo1kwy (179:40)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 55 * fem, 158 * fem),
                      width: 228 * fem,
                      height: 50 * fem,
                      child: Image.network(
                        "[Image url]",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // yourownhomegaj (179:30)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 170 * fem, 9 * fem),
                      child: Text(
                        'YOUR OWN HOME:',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 9 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.3625 * ffem / fem,
                          color: Color(0xffc69963),
                        ),
                      ),
                    ),
                    Container(
                      // theultimatepersonalfreedomNiT (179:31)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 58 * fem, 33 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 193 * fem,
                      ),
                      child: Text(
                        'The Ultimate Personal\nFreedom',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3625 * ffem / fem,
                          letterSpacing: 0.68 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupmjvq3Zh (W7gU68eg5qWABJZrGAMjVq)
                      margin: EdgeInsets.fromLTRB(
                          54 * fem, 0 * fem, 140 * fem, 11.5 * fem),
                      width: double.infinity,
                      height: 40 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                        borderRadius: BorderRadius.circular(7 * fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 17 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3625 * ffem / fem,
                              letterSpacing: 0.68 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // logingMm (179:41)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 203 * fem, 108.5 * fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Neuton',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.265 * ffem / fem,
                            decoration: TextDecoration.underline,
                            color: Color(0xffc69963),
                            decorationColor: Color(0xffc69963),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 23 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: 100 * fem,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                      ),
                    ),
                    SizedBox(
                      width: 29.5 * fem,
                    ),
                    Expanded(
                      child: Center(
                        // Wrap the 'Seen on' text with an Expanded widget
                        child: Text(
                          'Seen on',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            letterSpacing: 0.68 * fem,
                            color: Color(0xffc69963),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 29.5 * fem,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: 100 * fem,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 23 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: 100 * fem,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                      ),
                    ),
                    SizedBox(
                      width: 29.5 * fem,
                    ),
                    Expanded(
                      child: Center(
                        // Wrap the 'Seen on' text with an Expanded widget
                        child: Text(
                          'Seen on',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            letterSpacing: 0.68 * fem,
                            color: Color(0xffc69963),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 29.5 * fem,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: 100 * fem,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogrouptqomNVV (W7gUEiEiK6sUHpvxMCtqom)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 23 * fem),
                child: Center(
                  // <-- Added Center widget here
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // line1ukK (179:34)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
                        width: 100 * fem,
                        height: 1 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffc69963),
                        ),
                      ),
                      SizedBox(
                        width: 29.5 * fem,
                      ),
                      Center(
                        // seenonpcP (179:35)
                        child: Text(
                          'Seen on',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            letterSpacing: 0.68 * fem,
                            color: Color(0xffc69963),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 29.5 * fem,
                      ),
                      Container(
                        // line2wh1 (179:36)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
                        width: 100 * fem,
                        height: 1 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffc69963),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // autogroup7vcfk2B (W7gUSsZ7k6h8v6wb8eT7WP)
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // logobbc1pko (179:37)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 2 * fem, 31 * fem, 0 * fem),
                      width: 91 * fem,
                      height: 27 * fem,
                      child: Image.network(
                        "[Image url]",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // logoxWV9Ib (179:38)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 2 * fem, 0 * fem, 0 * fem),
                      width: 75 * fem,
                      height: 30 * fem,
                      child: Image.network(
                        "[Image url]",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // logomIoZ3U (179:39)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 2 * fem, 37 * fem, 0 * fem),
                      width: 71 * fem,
                      height: 32 * fem,
                      child: Image.network(
                        "[Image url]",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // logopmKiNq (179:42)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 2 * fem, 45 * fem, 0 * fem),
                      width: 72 * fem,
                      height: 31 * fem,
                      child: Image.network(
                        "[Image url]",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupgcqF0H (W7gUTkmDVXqNSVzUe8CqF0)
                width: double.infinity,
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 15 * fem, 0 * fem, 16 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // oval (179:43)
                      width: 72 * fem,
                      height: 72 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      // group12J4oQ8 (179:45)
                      margin: EdgeInsets.fromLTRB(
                          22 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 72 * fem,
                      height: 72 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      // ovalkkckfp (179:44)
                      margin: EdgeInsets.fromLTRB(
                          22 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 72 * fem,
                      height: 72 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffc69963),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyCustomApp());
}
