import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian/companie_assets/presentation/controller/companies_assets_controller.dart';
import 'package:tractian/companie_assets/presentation/widgets/builder_general.dart';
import 'package:tractian/companie_assets/presentation/widgets/custom_switch.dart';
import 'package:tractian/home/features/get_companies/companie.entity.dart';

class CompanieAssets extends StatefulWidget {
  final Companie companie;
  const CompanieAssets({super.key, required this.companie});

  @override
  State<CompanieAssets> createState() => _CompanieAssetsState();
}

class _CompanieAssetsState extends State<CompanieAssets> {
  final CompaniesAssetsController _controller = CompaniesAssetsController();

  @override
  void initState() {
    _controller.companie = widget.companie;
    _controller.loadingRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 23, 25, 45),
        title: const Text('Assets', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        return SingleChildScrollView(
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
                  child: Observer(builder: (_) {
                    return TextFormField(
                      onChanged: (value) {
                        _controller.setTextFilter(value);
                      },
                      controller: _controller.find,
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
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 16),
                  CustomSwitch(
                    value: _controller.sensor,
                    name: 'Sensor de Energia',
                    onTap: () {
                      _controller.setSensor(!_controller.sensor);
                    },
                    svgPath: _controller.sensor
                        ? 'assets/BOLT.svg'
                        : 'assets/BOLT_FALSE.svg',
                  ),
                  const SizedBox(width: 8),
                  CustomSwitch(
                    value: _controller.critical,
                    name: 'Crítico',
                    onTap: () {
                      _controller.setCritical(!_controller.critical);
                    },
                    svgPath: _controller.critical
                        ? 'assets/CRITICO.svg'
                        : 'assets/CRITICO_FALSE.svg',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _controller.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Observer(builder: (_) {
                      return GeneralListView(
                          list: _controller.filteredGeneral.asObservable(),
                          expanded: _controller.expanded);
                    }),
            ],
          ),
        );
      }),
    );
  }
}
