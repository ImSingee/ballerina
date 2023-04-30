import ballerina/test;

@test:Config
function testingForEggsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config
function testingForEggsAllergyAllergicOnlyToEggs() {
    var sut = new Allergies(1);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config
function testingForEggsAllergyAllergicToEggsAndSomethingElse() {
    var sut = new Allergies(3);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config
function testingForEggsAllergyAllergicToSomethingButNotEggs() {
    var sut = new Allergies(2);
    test:assertFalse(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config
function testingForEggsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Eggs));
}

@test:Config
function testingForPeanutsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config
function testingForPeanutsAllergyAllergicOnlyToPeanuts() {
    var sut = new Allergies(2);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config
function testingForPeanutsAllergyAllergicToPeanutsAndSomethingElse() {
    var sut = new Allergies(7);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config
function testingForPeanutsAllergyAllergicToSomethingButNotPeanuts() {
    var sut = new Allergies(5);
    test:assertFalse(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config
function testingForPeanutsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Peanuts));
}

@test:Config
function testingForShellfishAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config
function testingForShellfishAllergyAllergicOnlyToShellfish() {
    var sut = new Allergies(4);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config
function testingForShellfishAllergyAllergicToShellfishAndSomethingElse() {
    var sut = new Allergies(14);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config
function testingForShellfishAllergyAllergicToSomethingButNotShellfish() {
    var sut = new Allergies(10);
    test:assertFalse(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config
function testingForShellfishAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Shellfish));
}

@test:Config
function testingForStrawberriesAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config
function testingForStrawberriesAllergyAllergicOnlyToStrawberries() {
    var sut = new Allergies(8);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config
function testingForStrawberriesAllergyAllergicToStrawberriesAndSomethingElse() {
    var sut = new Allergies(28);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config
function testingForStrawberriesAllergyAllergicToSomethingButNotStrawberries() {
    var sut = new Allergies(20);
    test:assertFalse(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config
function testingForStrawberriesAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Strawberries));
}

@test:Config
function testingForTomatoesAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config
function testingForTomatoesAllergyAllergicOnlyToTomatoes() {
    var sut = new Allergies(16);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config
function testingForTomatoesAllergyAllergicToTomatoesAndSomethingElse() {
    var sut = new Allergies(56);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config
function testingForTomatoesAllergyAllergicToSomethingButNotTomatoes() {
    var sut = new Allergies(40);
    test:assertFalse(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config
function testingForTomatoesAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Tomatoes));
}

@test:Config
function testingForChocolateAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config
function testingForChocolateAllergyAllergicOnlyToChocolate() {
    var sut = new Allergies(32);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config
function testingForChocolateAllergyAllergicToChocolateAndSomethingElse() {
    var sut = new Allergies(112);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config
function testingForChocolateAllergyAllergicToSomethingButNotChocolate() {
    var sut = new Allergies(80);
    test:assertFalse(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config
function testingForChocolateAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Chocolate));
}

@test:Config
function testingForPollenAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config
function testingForPollenAllergyAllergicOnlyToPollen() {
    var sut = new Allergies(64);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config
function testingForPollenAllergyAllergicToPollenAndSomethingElse() {
    var sut = new Allergies(224);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config
function testingForPollenAllergyAllergicToSomethingButNotPollen() {
    var sut = new Allergies(160);
    test:assertFalse(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config
function testingForPollenAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Pollen));
}

@test:Config
function testingForCatsAllergyNotAllergicToAnything() {
    var sut = new Allergies(0);
    test:assertFalse(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config
function testingForCatsAllergyAllergicOnlyToCats() {
    var sut = new Allergies(128);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config
function testingForCatsAllergyAllergicToCatsAndSomethingElse() {
    var sut = new Allergies(192);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config
function testingForCatsAllergyAllergicToSomethingButNotCats() {
    var sut = new Allergies(64);
    test:assertFalse(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config
function testingForCatsAllergyAllergicToEverything() {
    var sut = new Allergies(255);
    test:assertTrue(sut.IsAllergicTo(Allergen.Cats));
}

@test:Config
function noAllergies() {
    var sut = new Allergies(0);
    Assert.Empty(sut.List());
}

@test:Config
function justEggs() {
    var sut = new Allergies(1);
    var expected = [ Allergen.Eggs ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function justPeanuts() {
    var sut = new Allergies(2);
    var expected = [ Allergen.Peanuts ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function justStrawberries() {
    var sut = new Allergies(8);
    var expected = [ Allergen.Strawberries ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function eggsAndPeanuts() {
    var sut = new Allergies(3);
    var expected = [ Allergen.Eggs, Allergen.Peanuts ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function moreThanEggsButNotPeanuts() {
    var sut = new Allergies(5);
    var expected = [ Allergen.Eggs, Allergen.Shellfish ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function lotsOfStuff() {
    var sut = new Allergies(248);
    var expected = [ Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function everything() {
    var sut = new Allergies(255);
    var expected = [ Allergen.Eggs, Allergen.Peanuts, Allergen.Shellfish, Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function noAllergenScoreParts() {
    var sut = new Allergies(509);
    var expected = [ Allergen.Eggs, Allergen.Shellfish, Allergen.Strawberries, Allergen.Tomatoes, Allergen.Chocolate, Allergen.Pollen, Allergen.Cats ];
    test:assertEquals(expected, sut.List());
}

@test:Config
function noAllergenScorePartsWithoutHighestValidScore() {
    var sut = new Allergies(257);
    var expected = [ Allergen.Eggs ];
    test:assertEquals(expected, sut.List());
}
