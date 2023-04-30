import ballerina/test;

@test:Config
function rosterIsEmptyWhenNoStudentIsAdded() {
    var sut = new GradeSchool();
    Assert.Empty(sut.Roster());
}

@test:Config
function addAStudent() {
    var sut = new GradeSchool();
    test:assertTrue(sut.Add("Aimee", 2));
}

@test:Config
function studentIsAddedToTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Aimee" ];
    sut.Add("Aimee", 2);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function addingMultipleStudentsInTheSameGradeInTheRoster() {
    var sut = new GradeSchool();
    test:assertTrue(sut.Add("Blair", 2));
    test:assertTrue(sut.Add("James", 2));
    test:assertTrue(sut.Add("Paul", 2));
}

@test:Config
function multipleStudentsInTheSameGradeAreAddedToTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Blair", "James", "Paul" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("Paul", 2);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function cannotAddStudentToSameGradeInTheRosterMoreThanOnce() {
    var sut = new GradeSchool();
    test:assertTrue(sut.Add("Blair", 2));
    test:assertTrue(sut.Add("James", 2));
    test:assertFalse(sut.Add("James", 2));
    test:assertTrue(sut.Add("Paul", 2));
}

@test:Config
function studentNotAddedToSameGradeInTheRosterMoreThanOnce() {
    var sut = new GradeSchool();
    var expected = [ "Blair", "James", "Paul" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("James", 2);
    sut.Add("Paul", 2);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function addingStudentsInMultipleGrades() {
    var sut = new GradeSchool();
    test:assertTrue(sut.Add("Chelsea", 3));
    test:assertTrue(sut.Add("Logan", 7));
}

@test:Config
function studentsInMultipleGradesAreAddedToTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Chelsea", "Logan" ];
    sut.Add("Chelsea", 3);
    sut.Add("Logan", 7);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function cannotAddSameStudentToMultipleGradesInTheRoster() {
    var sut = new GradeSchool();
    test:assertTrue(sut.Add("Blair", 2));
    test:assertTrue(sut.Add("James", 2));
    test:assertFalse(sut.Add("James", 3));
    test:assertTrue(sut.Add("Paul", 3));
}

@test:Config
function studentNotAddedToMultipleGradesInTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Blair", "James", "Paul" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("James", 3);
    sut.Add("Paul", 3);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function studentsAreSortedByGradesInTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Anna", "Peter", "Jim" ];
    sut.Add("Jim", 3);
    sut.Add("Peter", 2);
    sut.Add("Anna", 1);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function studentsAreSortedByNameInTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Alex", "Peter", "Zoe" ];
    sut.Add("Peter", 2);
    sut.Add("Zoe", 2);
    sut.Add("Alex", 2);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function studentsAreSortedByGradesAndThenByNameInTheRoster() {
    var sut = new GradeSchool();
    var expected = [ "Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim" ];
    sut.Add("Peter", 2);
    sut.Add("Anna", 1);
    sut.Add("Barb", 1);
    sut.Add("Zoe", 2);
    sut.Add("Alex", 2);
    sut.Add("Jim", 3);
    sut.Add("Charlie", 1);
    test:assertEquals(expected, sut.Roster());
}

@test:Config
function gradeIsEmptyIfNoStudentsInTheRoster() {
    var sut = new GradeSchool();
    Assert.Empty(sut.Grade(1));
}

@test:Config
function gradeIsEmptyIfNoStudentsInThatGrade() {
    var sut = new GradeSchool();
    sut.Add("Peter", 2);
    sut.Add("Zoe", 2);
    sut.Add("Alex", 2);
    sut.Add("Jim", 3);
    Assert.Empty(sut.Grade(1));
}

@test:Config
function studentNotAddedToSameGradeMoreThanOnce() {
    var sut = new GradeSchool();
    var expected = [ "Blair", "James", "Paul" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("James", 2);
    sut.Add("Paul", 2);
    test:assertEquals(expected, sut.Grade(2));
}

@test:Config
function studentNotAddedToMultipleGrades() {
    var sut = new GradeSchool();
    var expected = [ "Blair", "James" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("James", 3);
    sut.Add("Paul", 3);
    test:assertEquals(expected, sut.Grade(2));
}

@test:Config
function studentNotAddedToOtherGradeForMultipleGrades() {
    var sut = new GradeSchool();
    var expected = [ "Paul" ];
    sut.Add("Blair", 2);
    sut.Add("James", 2);
    sut.Add("James", 3);
    sut.Add("Paul", 3);
    test:assertEquals(expected, sut.Grade(3));
}

@test:Config
function studentsAreSortedByNameInAGrade() {
    var sut = new GradeSchool();
    var expected = [ "Bradley", "Franklin" ];
    sut.Add("Franklin", 5);
    sut.Add("Bradley", 5);
    sut.Add("Jeff", 1);
    test:assertEquals(expected, sut.Grade(5));
}
