import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/models/project.dart';
import 'package:minha_mente/models/my_search_delegate.dart';
import 'package:minha_mente/models/team.dart';
import 'package:minha_mente/screens/team_form.dart';
import 'package:minha_mente/screens/project_form.dart';
import 'package:minha_mente/screens/the_project.dart';
import 'package:minha_mente/screens/the_team.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  final List<Project> projects = [];
  final ProjectDao _dao = ProjectDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Projetos',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 18,
                        child: FutureBuilder<List<Project>>(
                          initialData: const [],
                          future: _dao.findAll(),
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
                                    return ProjectItem(project);
                                  },
                                  itemCount: projects.length,
                                  itemExtent: 100,
                                );
                            }
                            return Text('Unknown Error');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 1.0,
                    child: Card(
                      child: Text(''),
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Equipes',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FutureBuilder<List<Team>>(
                              initialData: const [],
                              future: _dao.findAllTeams(),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    break;
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    final List<Team> teams =
                                        snapshot.data as List<Team>;
                                    return Wrap(
                                      direction: Axis.vertical,
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      children: [
                                        SizedBox(
                                          width: 330,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final Team team = teams[index];
                                              return _TeamItem(team);
                                            },
                                            itemCount: teams.length,
                                            itemExtent: 70,
                                          ),
                                        ),
                                      ],
                                    );
                                }
                                return Text('Unknown Error');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 1.0,
                    child: Card(
                      child: Text(''),
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('Arquivos',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.0,
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FittedBox(
        child: SpeedDial(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: Icons.add,
          activeIcon: Icons.close,
          overlayColor: Theme.of(context).colorScheme.tertiary,
          overlayOpacity: 0.2,
          buttonSize: const Size(48.0, 48.0),
          childrenButtonSize: const Size(48.0, 48.0),
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
              label: 'New Project',
              child: Icon(Icons.post_add_outlined),
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => ProjectForm(),
                      ),
                    )
                    .then(
                      (value) => setState(() {}),
                    );
              },
            ),
            SpeedDialChild(
              label: 'New Team',
              child: Icon(Icons.group_add),
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => TeamForm(),
                      ),
                    )
                    .then(
                      (value) => setState(() {}),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final Project project;
  final double _iconSize = 32.0;
  final ProjectDao _dao = ProjectDao();

  ProjectItem(this.project);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          project.name,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        subtitle: Text(
          project.info,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          iconSize: _iconSize,
          color: Colors.red[300],
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(top: 17.0),
          onPressed: () {
            _dao.delete(project.id).then((value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProjectsList(),
                  ),
                ));
          },
        ),
        onTap: () {
          _SendNameOfProject(context);
        },
        tileColor: Color.fromRGBO(107, 127, 242, 0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  void _SendNameOfProject(BuildContext context) {
    final String _nameOfProject = project.name;
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => new TheProject(
                text: _nameOfProject,
              )),
    );
  }
}

class _TeamItem extends StatelessWidget {
  final Team team;

  _TeamItem(this.team);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          team.teamName,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        subtitle: Text(
          team.teamInfo,
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        onTap: () {
          _SendNameOfTeam(context);
        },
        tileColor: Color.fromRGBO(107, 127, 242, 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  void _SendNameOfTeam(BuildContext context) {
    final String _nameOfTeam = team.teamName;
    final int _idOfTeam = team.teamId;
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => new TheTeam(
                text: _nameOfTeam,
                teamId: _idOfTeam,
              )),
    );
  }
}
