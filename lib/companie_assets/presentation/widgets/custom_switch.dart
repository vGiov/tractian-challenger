import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final String name;
  final String svgPath;
  final Function() onTap;
  const CustomSwitch({
    super.key,
    required this.value,
    required this.name,
    required this.svgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: value ? const Color.fromARGB(255, 33, 136, 255) : null,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value
                ? const Color.fromARGB(255, 33, 136, 255)
                : const Color.fromARGB(255, 213, 215, 216),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            children: [
              SvgPicture.asset(svgPath),
              const SizedBox(width: 6),
              Text(
                name,
                style:
                    TextStyle(color: value ? Colors.white : Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
