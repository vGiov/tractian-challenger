import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian/assets/controller.dart';
import 'package:tractian/assets/widgets/builder_general.dart';
import 'package:tractian/assets/widgets/custom_switch.dart';
import 'package:tractian/home/get_companies.dart';

class Assets extends StatefulWidget {
  final Companie companie;
  const Assets({super.key, required this.companie});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  final AssetsController controller = AssetsController();

  @override
  void initState() {
    super.initState();
    loadingRequest();
  }

  Future<void> loadingRequest() async {
    setState(() {
      controller.setLoading(true);
    });
    await controller.getGeneral(widget.companie.id);
    setState(() {
      controller.setLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 25, 45),
        title: const Text('Assets', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFFEAEFF3),
                ),
                child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 23, 25, 45),
                  decoration: InputDecoration(
                      hintText: 'Buscar Ativo ou Local',
                      hintStyle: const TextStyle(
                        color: Color(0xFF8E98A3),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset(
                          'assets/SEARCH.svg',
                        ),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 16),
                CustomSwitch(
                  value: controller.sensor,
                  name: 'Sensor de Energia',
                  onTap: () {
                    setState(() {
                      controller.toggleSensor();
                    });
                  },
                  svgPath: controller.sensor
                      ? 'assets/BOLT.svg'
                      : 'assets/BOLT_FALSE.svg',
                ),
                const SizedBox(width: 8),
                CustomSwitch(
                  value: controller.critico,
                  name: 'Crítico',
                  onTap: () {
                    setState(() {
                      controller.toggleCritico();
                    });
                  },
                  svgPath: controller.critico
                      ? 'assets/CRITICO.svg'
                      : 'assets/CRITICO_FALSE.svg',
                ),
              ],
            ),
            const SizedBox(height: 8),
            controller.loading
                ? const CircularProgressIndicator()
                : GeneralListView(list: controller.general),
          ],
        ),
      ),
    );
  }
}
