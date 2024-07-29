import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vaynow_flutter/view/web_view/web_view_screen.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 150),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 180,
                  ),
                  const SizedBox(height: 20),
                  const Text('Đối tác duy nhất của giải LaLiga',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 20),
                  _buildTextField(
                      hint: 'Tài khoản đăng nhập', icon: Icons.person),
                  _buildTextField(hint: 'Số điện thoại', icon: Icons.phone),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const WebViewScreen(
                                    initialUrl: 'https://new88030.com/Login',
                                    titlePage: 'New88030',
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text('Đăng nhập'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const WebViewScreen(
                                    initialUrl:
                                        'https://new88030.com/?a=2424228',
                                    titlePage: 'New88030',
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text('Đăng ký'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  launchButton(
                      context, 'Hỗ trợ nhận khuyến mãi', 'MAITRANG_TROLYBCR',
                      isTelegram: true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          icon: Icon(icon, color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget launchButton(BuildContext context, String text, String url,
      {bool isTelegram = false}) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          // MaterialPageRoute(
          //     builder: (_) => const WebViewContainer(
          //         url: 'tg://resolve?domain=MAITRANG_TROLYBCR'));
          launchURL(context, url, isTelegram);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal, // Button color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(text),
      ),
    );
  }

  Future<void> launchURL(
      BuildContext context, String url, bool isTelegram) async {
    final Uri launchUri = isTelegram
        ? Uri.parse("tg://resolve?domain=${url.split('/').last}")
        : Uri.parse(url);
    if (!await launchUrl(launchUri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Could not open the app or app not installed')),
      );
    }
  }
}
