part of ex4;

class ex4 extends ConceptEntity<ex4> {

  String _name;
  String description;

  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }

  ex4 newEntity() => new ex4();


  bool get onProgramming =>
      description.contains('Programming') ? true : false;

  int compareTo(ex4 other) {
    return name.compareTo(other.name);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////
class Projects extends ConceptEntities<ex4> {

  Projects newEntities() => new Projects();
  ex4 newEntity() => new ex4();
}