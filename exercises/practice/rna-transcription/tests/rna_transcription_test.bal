import ballerina/test;

@test:Config
function emptyRnaSequence() {
    test:assertEquals("", RnaTranscription.ToRna(""));
}

@test:Config
function rnaComplementOfCytosineIsGuanine() {
    test:assertEquals("G", RnaTranscription.ToRna("C"));
}

@test:Config
function rnaComplementOfGuanineIsCytosine() {
    test:assertEquals("C", RnaTranscription.ToRna("G"));
}

@test:Config
function rnaComplementOfThymineIsAdenine() {
    test:assertEquals("A", RnaTranscription.ToRna("T"));
}

@test:Config
function rnaComplementOfAdenineIsUracil() {
    test:assertEquals("U", RnaTranscription.ToRna("A"));
}

@test:Config
function rnaComplement() {
    test:assertEquals("UGCACCAGAAUU", RnaTranscription.ToRna("ACGTGGTCTTAA"));
}
