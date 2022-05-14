import 'package:flutter/material.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/models/project.dart';

class ProjectForm extends StatefulWidget {
  const ProjectForm({Key? key}) : super(key: key);

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final TextEditingController _projectIdController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  final ProjectDao _dao = ProjectDao();
  final double _fontSizeBtns = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Project'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: TextFormField(
                  controller: _projectIdController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Project Id',
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
                  controller: _projectNameController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Project Name',
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
                  controller: _infoController,
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
                    child: Text('Create'),
                    onPressed: () {
                      final projectId = int.tryParse(_projectIdController.text);
                      final String projectName = _projectNameController.text;
                      final String info = _infoController.text;
                      final Project newProject =
                          Project(projectId!, projectName, info, 0);
                      _dao
                          .save(newProject)
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
