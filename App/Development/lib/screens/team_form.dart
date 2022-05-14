import 'package:flutter/material.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/models/team.dart';

class TeamForm extends StatefulWidget {
  const TeamForm({Key? key}) : super(key: key);

  @override
  State<TeamForm> createState() => _TeamFormState();
}

class _TeamFormState extends State<TeamForm> {
  final TextEditingController _teamIdController = TextEditingController();
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _teamInfoController = TextEditingController();
  final ProjectDao _dao = ProjectDao();
  final double _fontSizeBtns = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Team'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: TextFormField(
                  controller: _teamIdController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Team Id',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  // readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: _teamNameController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Team Name',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 34.0),
                child: TextFormField(
                  controller: _teamInfoController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Information',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.tertiary,
                      textStyle: TextStyle(
                        fontSize: _fontSizeBtns,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 202, 202, 1),
                      ),
                    ),
                    child: Text('Create Team'),
                    onPressed: () {
                      final teamId = int.tryParse(_teamIdController.text);
                      final String teamName = _teamNameController.text;
                      final String teamInfo = _teamInfoController.text;
                      final Team newTeam =
                      Team(teamId!, teamName, teamInfo);
                      _dao
                          .saveTeam(newTeam)
                          .then((value) => Navigator.pop(context));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
