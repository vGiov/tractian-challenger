import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian/assets/general.dart';
import 'package:tractian/assets/widgets/custom_expansion.dart';

class GeneralListView extends StatelessWidget {
  final List<General> list;
  final bool expanded;
  const GeneralListView(
      {super.key, required this.list, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GeneralTile(
          general: list[index],
          expanded: expanded,
        );
      },
    );
  }
}

class GeneralTile extends StatelessWidget {
  final General general;
  final bool expanded;
  const GeneralTile({super.key, required this.general, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return general.general.isEmpty
        ? SizedBox(
            height: 28,
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset(
                  general.isLocation
                      ? 'assets/location.svg'
                      : general.isAsset
                          ? 'assets/cube.svg'
                          : 'assets/Codepen.svg',
                ),
                const SizedBox(width: 8),
                Text(
                  general.name,
                  style: const TextStyle(fontSize: 13),
                ),
                if (general.status != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset(
                      general.status == 'operating'
                          ? 'assets/boltGo.svg'
                          : general.status == 'alert'
                              ? 'assets/Ellipse.svg'
                              : 'assets/Ellipse.svg',
                    ),
                  ),
              ],
            ),
          )
        : CustomExpansionTile(
            expanded: expanded,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  general.isLocation
                      ? 'assets/location.svg'
                      : general.isAsset
                          ? 'assets/cube.svg'
                          : 'assets/Codepen.svg',
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    general.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            children: general.general.isNotEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GeneralListView(
                        list: general.general,
                        expanded: expanded,
                      ),
                    )
                  ]
                : [],
          );
  }
}
