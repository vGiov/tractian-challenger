import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian/assets/assets.dart';
import 'package:tractian/home/get_companies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Companie> companies = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getCompanies();
  }

  Future<void> getCompanies() async {
    companies.clear();
    setState(() {
      loading = true;
    });
    companies.addAll(await fetchCompanies());
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 25, 45),
        title: SvgPicture.asset(
          'assets/LOGO.svg',
        ),
        centerTitle: true,
      ),
      body: loading
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
                    onRefresh: getCompanies,
                    child: ListView.builder(
                      itemCount: companies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 22, right: 22),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Assets(companie: companies[index]),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 26),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 32),
                                    SvgPicture.asset(
                                      'assets/HOME_ICON.svg',
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      companies[index].name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
