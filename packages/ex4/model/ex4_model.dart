// une classe ex4, correspondant à l'application javascript de todo avec un paramètre nommé tasktodo qui correspond à la tâche à accmplir


part of ex4;

class ex4app extends ConceptModel {

  static final String project = 'ex4';

  Map<String, ConceptEntities> newEntries() {
    var projects = new Projects();
    var map = new Map<String, ConceptEntities>();
    map[project] = projects;
    return map;
  }

  Projects get projects => getEntry(project);

  init() {
    var tasktodo = new Projects();
    tasktodo.name = 'ex4app task';
    tasktodo.description =
        'Rajouter une tâche dans la liste des todo.';
    projects.add(tasktodo);
  }

  display() {
    print('ex4');
    print('=============');
    projects.display('ex4app');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}
