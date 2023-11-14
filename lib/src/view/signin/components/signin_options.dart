import 'package:flutter/material.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});
  static const IconData apple = IconData(0xf04be, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFECEEEF)),
                borderRadius: BorderRadius.circular(48),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                  spreadRadius: -4,
                )
              ],
            ),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.only(right: 8)),
                ),
                onPressed: () {
                  print("google");
                },
                icon: const Image(
                  image: AssetImage(
                    'assets/logos/google_light.png',
                    package: 'flutter_signin_button',
                  ),
                ),
                label: const Text(
                  'Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0F1D27),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFECEEEF)),
                borderRadius: BorderRadius.circular(48),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                  spreadRadius: -4,
                )
              ],
            ),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.only(right: 8)),
                ),
                onPressed: () {
                  print("apple");
                },
                icon: const Icon(
                  apple,
                  color: Colors.black,
                ),
                label: const Text(
                  'Apple',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0F1D27),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
