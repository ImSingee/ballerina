import ballerina/test;

@test:Config
function partialGardenGardenWithSingleStudent() {
    var sut = new KindergartenGarden("RC\nGG");
    test:assertEquals([ Plant.Radishes, Plant.Clover, Plant.Grass, Plant.Grass ], sut.Plants("Alice"));
}

@test:Config
function partialGardenDifferentGardenWithSingleStudent() {
    var sut = new KindergartenGarden("VC\nRC");
    test:assertEquals([ Plant.Violets, Plant.Clover, Plant.Radishes, Plant.Clover ], sut.Plants("Alice"));
}

@test:Config
function partialGardenGardenWithTwoStudents() {
    var sut = new KindergartenGarden("VVCG\nVVRC");
    test:assertEquals([ Plant.Clover, Plant.Grass, Plant.Radishes, Plant.Clover ], sut.Plants("Bob"));
}

@test:Config
function partialGardenMultipleStudentsForTheSameGardenWithThreeStudentsSecondStudentsGarden() {
    var sut = new KindergartenGarden("VVCCGG\nVVCCGG");
    test:assertEquals([ Plant.Clover, Plant.Clover, Plant.Clover, Plant.Clover ], sut.Plants("Bob"));
}

@test:Config
function partialGardenMultipleStudentsForTheSameGardenWithThreeStudentsThirdStudentsGarden() {
    var sut = new KindergartenGarden("VVCCGG\nVVCCGG");
    test:assertEquals([ Plant.Grass, Plant.Grass, Plant.Grass, Plant.Grass ], sut.Plants("Charlie"));
}

@test:Config
function fullGardenForAliceFirstStudentsGarden() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Violets, Plant.Radishes, Plant.Violets, Plant.Radishes ], sut.Plants("Alice"));
}

@test:Config
function fullGardenForBobSecondStudentsGarden() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Clover, Plant.Grass, Plant.Clover, Plant.Clover ], sut.Plants("Bob"));
}

@test:Config
function fullGardenForCharlie() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Violets, Plant.Violets, Plant.Clover, Plant.Grass ], sut.Plants("Charlie"));
}

@test:Config
function fullGardenForDavid() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Radishes, Plant.Violets, Plant.Clover, Plant.Radishes ], sut.Plants("David"));
}

@test:Config
function fullGardenForEve() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Clover, Plant.Grass, Plant.Radishes, Plant.Grass ], sut.Plants("Eve"));
}

@test:Config
function fullGardenForFred() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Grass, Plant.Clover, Plant.Violets, Plant.Clover ], sut.Plants("Fred"));
}

@test:Config
function fullGardenForGinny() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Clover, Plant.Grass, Plant.Grass, Plant.Clover ], sut.Plants("Ginny"));
}

@test:Config
function fullGardenForHarriet() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Violets, Plant.Radishes, Plant.Radishes, Plant.Violets ], sut.Plants("Harriet"));
}

@test:Config
function fullGardenForIleana() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Grass, Plant.Clover, Plant.Violets, Plant.Clover ], sut.Plants("Ileana"));
}

@test:Config
function fullGardenForJoseph() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Violets, Plant.Clover, Plant.Violets, Plant.Grass ], sut.Plants("Joseph"));
}

@test:Config
function fullGardenForKincaidSecondToLastStudentsGarden() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Grass, Plant.Clover, Plant.Clover, Plant.Grass ], sut.Plants("Kincaid"));
}

@test:Config
function fullGardenForLarryLastStudentsGarden() {
    var sut = new KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
    test:assertEquals([ Plant.Grass, Plant.Violets, Plant.Clover, Plant.Violets ], sut.Plants("Larry"));
}
