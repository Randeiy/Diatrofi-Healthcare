import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/provider/resep_list_provider.dart';
import 'package:diatfori/widget/resep_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResepScreen extends StatefulWidget {
  static const ROUTE_NAME = '/reseplist';
  const ResepScreen({super.key});

  @override
  State<ResepScreen> createState() => _ResepScreenState();
}

class _ResepScreenState extends State<ResepScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView(
        children: [
          // title
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: const Icon(
                  Icons.restaurant,
                  size: 50,
                  color: kStrongGreen,
                ),
                title: Text('Resep Sehat !',
                    style:
                        kTitleScreen.copyWith(fontWeight: FontWeight.normal)),
                subtitle: const Text('Top Resep Sehat Hari Ini !'),
              )),

          SizedBox(
              height: MediaQuery.of(context).size.height, child: _buildList()),
        ],
      ),
    );
  }

  _buildList() {
    return Consumer<ResepListProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: state
              .result.results.length, // ke halaman article utk artikel lengkap
          itemBuilder: (context, index) {
            var restaurant = state.result.results[index];
            return ResepCard(resep: restaurant);
          },
        );
      } else if (state.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else if (state.state == ResultState.error) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else {
        return const Center(
          child: Material(
            child: Text(''),
          ),
        );
      }
    });
  }
}
