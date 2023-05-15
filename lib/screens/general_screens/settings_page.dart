import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final String? congregationName;
  const SettingsPage({Key? key, this.congregationName}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String name = 'John Doe';
  String defEmail = 'default@email.com';

  String _selectedTheme = 'System Settings (default)';
  final List<String> _themeOptions = [
    'System Settings (default)',
    'Dark Mode',
    'Light Mode',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: const Text(
                        'Name:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(name),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ListTile(
                      title: Text(
                        'Status:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text('Admin'),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: const Text(
                        'Congregation Name:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle:
                          Text(widget.congregationName ?? '-no congregation-'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Settings',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: const Text('Theme:'),
                      trailing: DropdownButton<String>(
                        value: _selectedTheme,
                        items: _themeOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTheme = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Settings',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: const Text(
                        'Email:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(defEmail),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.exit_to_app),
                          onPressed: () {},
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
