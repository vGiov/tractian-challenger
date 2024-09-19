import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSwitch extends StatefulWidget {
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
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: widget.onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: widget.value ? const Color.fromARGB(255, 33, 136, 255) : null,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.value
                ? const Color.fromARGB(255, 33, 136, 255)
                : const Color.fromARGB(255, 213, 215, 216),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Row(
            children: [
              SvgPicture.asset(widget.svgPath),
              const SizedBox(width: 6),
              Text(
                widget.name,
                style:
                    TextStyle(color: widget.value ? Colors.white : Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
