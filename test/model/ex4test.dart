import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:ex4/ex4.dart';


// j'ai repris quelque uns de vos tests! Merci.
/////////////////////////////////////////////////////////////////////////////////////////
testProjects(Projects projects) {
  group("Testing Projects", () {
    setUp(() {
      var projectCount = 0;
      expect(projects.length, equals(projectCount));

      var tasktodo = new ex4();
      expect(tasktodo, isNotNull);
      tasktodo.name = 'Dartling Design';
      tasktodo.description =
          'création de lexercice 4 (test)';
      projects.add(tasktodo);
      expect(projects.length, equals(++projectCount));

   
    });
    tearDown(() {
      projects.clear();
      expect(projects.isEmpty, isTrue);
    });
    
/////////////////////////////////////////////////////////////////////////////////////////    
/////////////////////////////////////////////////////////////////////////////////////////    
    test('Add Project', () {
      var project = new ex4();
      expect(project, isNotNull);
      project.name = 'modelibra';
      project.description = 'domain model framework for educational purposes';
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project');
    });
    
    test('Order Projects by Name', () {
      projects.orderByFunction((m,n) => m.compareTo(n));
      projects.display('Order Projects by Name');
    });
    test('New Project', () {
      var projectCount = projects.length;
      var marketing = new ex4();
      expect(marketing, isNotNull);
      marketing.name = 'Dartlng Marketing';
      marketing.description = 'Making Dartling known to the Dart community.';
      var added = projects.add(marketing);
      expect(added, isTrue);
      expect(projects.length, equals(++projectCount));
      projects.display('New Project');
    });
    test('Copy Projects', () {
      Projects copiedProjects = projects.copy();
      expect(copiedProjects.isEmpty, isFalse);
      expect(copiedProjects.length, equals(projects.length));
      expect(copiedProjects, isNot(same(projects)));
      expect(copiedProjects, isNot(equals(projects)));
      copiedProjects.forEach((cp) =>
          expect(cp, isNot(same(projects.find(cp.name)))));
      copiedProjects.display('Copied Projects');
      //projects.display('Projects');
    });
    test('True for Every Project', () {
      expect(projects.every((p) => p.code != null), isTrue);
      expect(projects.every((p) => p.name != null), isTrue);
    });
    test('From Projects to JSON', () {
      var json = projects.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Project Model', () {
      List<Map<String, Object>> json = projects.toJson();
      projects.clear();
      expect(projects.isEmpty, isTrue);
      projects.fromJson(json);
      expect(projects.isEmpty, isFalse);
      projects.display('From JSON to Projects');
    });
    
    
  });
}
/////////////////////////////////////////////////////////////////////////////////////////
initDisplayModel() {
  ex4app projectModel = new ex4app();
  projectModel.init();
  projectModel.display();
}
/////////////////////////////////////////////////////////////////////////////////////////
testModel() {
  ex4app projectModel = new ex4app();
  Projects projects = projectModel.projects;
  testProjects(projects);
}
/////////////////////////////////////////////////////////////////////////////////////////
main() {
  //initDisplayModel();
  testModel();
}
