import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian/companie_assets/presentation/companie_assets.dart';
import 'package:tractian/home/features/get_companies/companie.entity.dart';

class Option extends StatelessWidget {
  final Companie companie;
  const Option({super.key, required this.companie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 22, right: 22),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CompanieAssets(companie: companie),
            ),
          );
        },
        borderRadius: BorderRadius.circular(5),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 33, 136, 255),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: Row(
              children: [
                const SizedBox(width: 32),
                SvgPicture.asset(
                  'assets/HOME_ICON.svg',
                ),
                const SizedBox(width: 10),
                Text(
                  companie.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
