import 'package:flutter/material.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/models/project.dart';
import 'package:minha_mente/screens/projects_list.dart';

class TheTeam extends StatefulWidget {
  final String text;
  final int teamId;

  const TheTeam({Key? key, required this.text, required this.teamId}) : super(key: key);


  @override
  State<TheTeam> createState() => _TheTeamState();
}

class _TheTeamState extends State<TheTeam> {
  final ProjectDao _dao = ProjectDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: new Text(
          widget.text,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 7.5),
            child: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red[700],
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 17.0),
              onPressed: () {
                _dao.deleteTeam(widget.teamId).then((value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProjectsList(),
                  ),
                ));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7.5),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Project>>(
        initialData: const [],
        future: _dao.findAllProjectsTeam(widget.teamId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Project> projects =
              snapshot.data as List<Project>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Project project = projects[index];
                  final ProjectItem _projectItem = ProjectItem(project);
                  return _projectItem;
                },
                itemCount: projects.length,
                itemExtent: 100,
              );
          }
          return Text('Unknown Error');
        },
      ),
    );
  }
}
