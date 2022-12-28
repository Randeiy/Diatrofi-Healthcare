import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/resep_search_provider.dart';
import 'package:diatfori/widget/card_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResepSearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';
  const ResepSearchPage({Key? key}) : super(key: key);
  @override
  State<ResepSearchPage> createState() => _ResepSearchPageState();
}

class _ResepSearchPageState extends State<ResepSearchPage> {
  TextEditingController controller = TextEditingController();
  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchResepProvider>(
      create: (_) => SearchResepProvider(apiService: ApiService()),
      child: Consumer<SearchResepProvider>(builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cari Resep'),
          ),
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.grey.shade500.withOpacity(0.23))
                      ]),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    decoration: InputDecoration(
                      hintText: 'cari resep apa ya . . .',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.23)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    onChanged: (String query) {
                      if (query.isNotEmpty) {
                        setState(() {
                          hasil = query;
                        });
                        state.fetchAllRestaurant(hasil);
                      }
                    },
                  ),
                ),

                // CEK HASIL
                (hasil.isEmpty)
                    ? Container()
                    : Consumer<SearchResepProvider>(
                        builder: (context, state, _) {
                          if (state.state == ResultState.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state.state == ResultState.hasData) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.result!.results.length,
                              itemBuilder: (context, index) {
                                var resep = state.result!.results[index];
                                return CardSearch(resep: resep);
                              },
                            );
                          } else if (state.state == ResultState.noData) {
                            return Center(child: Text(state.message));
                          } else if (state.state == ResultState.error) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                                child: Text('resepnya ga ketemu nih :/'));
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
