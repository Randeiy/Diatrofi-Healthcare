import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/provider/database_provider.dart';
import 'package:diatfori/widget/resep_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResepFavoriteScreen extends StatefulWidget {
  static const ROUTE_NAME = '/favorite';
  const ResepFavoriteScreen({super.key});

  @override
  State<ResepFavoriteScreen> createState() => _ResepFavoriteScreen();
}

class _ResepFavoriteScreen extends State<ResepFavoriteScreen> {
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
                  Icons.favorite,
                  size: 50,
                  color: kStrongGreen,
                ),
                title: Text('Resep Kesukaanmu !',
                    style:
                    kTitleScreen.copyWith(fontWeight: FontWeight.normal)),
                subtitle: const Text('Cobain resep yang kamu suka !'),
              )),

          SizedBox(
              height: MediaQuery.of(context).size.height, child: _buildList()),
        ],
      ),
    );
  }

  _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              var restaurant = state.favorites[index];
              return ResepCard(
                resep: restaurant,
              );
            },
          );
        } else if (state.state == ResultState.noData) {
          return const Center(child: Text('belum menambahkan resep nih :('));
        } else if (state.state == ResultState.error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );


  }
}
