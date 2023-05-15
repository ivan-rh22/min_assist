import 'package:flutter/material.dart';
import 'package:min_assist/screens/general_screens/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:min_assist/providers/congregation_provider.dart';

class TerritoryPage extends StatefulWidget {
  const TerritoryPage({Key? key}) : super(key: key);

  @override
  TerritoryPageState createState() => TerritoryPageState();
}

class TerritoryPageState extends State<TerritoryPage> {
  CongregationProvider? _congregationProvider;

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SettingsPage(
                congregationName: _congregationProvider!.congregation?.name ??
                    'Sample Congregation',
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    _congregationProvider =
        Provider.of<CongregationProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Territories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          ),
        ],
      ),
      body: _buildTerritoryPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTerritoryPage() {
    if (_congregationProvider!.congregation == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "No Congregation",
            style: Theme.of(context).textTheme.headlineSmall,
          )),
          Center(
              child: Text(
            "(Please Join or Create a Congregation)",
            style: Theme.of(context).textTheme.bodyLarge,
          )),
        ],
      );
    } else {
      final territories = _congregationProvider!.territories;
      if (territories.isEmpty) {
        return Center(
            child: ElevatedButton(
          onPressed: () {},
          child: const Text('Add Territories'),
        ));
      } else {
        return ListView.builder(
          itemCount: territories.length,
          itemBuilder: (BuildContext context, int index) {
            final territory = territories[index];
            return ListTile(
              title: Text('${territory.name} - ${territory.number}'),
              onTap: () {},
            );
          },
        );
      }
    }
  }
}
