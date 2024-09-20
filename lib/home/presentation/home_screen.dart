import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian/home/presentation/controller/home_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tractian/home/presentation/widgets/option.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    _controller.getCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 25, 45),
          title: SvgPicture.asset(
            'assets/LOGO.svg',
          ),
          centerTitle: true,
        ),
        body: _controller.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 23, 25, 45),
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 30),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _controller.getCompanies,
                      child: ListView.builder(
                        itemCount: _controller.companies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Option(companie: _controller.companies[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
