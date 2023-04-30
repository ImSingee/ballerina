import ballerina/test;

@test:Config
function emptyRnaSequenceResultsInNoProteins() {
    Assert.Empty(ProteinTranslation.Proteins(""));
}

@test:Config
function methionineRnaSequence() {
    test:assertEquals([ "Methionine" ], ProteinTranslation.Proteins("AUG"));
}

@test:Config
function phenylalanineRnaSequence_1() {
    test:assertEquals([ "Phenylalanine" ], ProteinTranslation.Proteins("UUU"));
}

@test:Config
function phenylalanineRnaSequence_2() {
    test:assertEquals([ "Phenylalanine" ], ProteinTranslation.Proteins("UUC"));
}

@test:Config
function leucineRnaSequence_1() {
    test:assertEquals([ "Leucine" ], ProteinTranslation.Proteins("UUA"));
}

@test:Config
function leucineRnaSequence_2() {
    test:assertEquals([ "Leucine" ], ProteinTranslation.Proteins("UUG"));
}

@test:Config
function serineRnaSequence_1() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCU"));
}

@test:Config
function serineRnaSequence_2() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCC"));
}

@test:Config
function serineRnaSequence_3() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCA"));
}

@test:Config
function serineRnaSequence_4() {
    test:assertEquals([ "Serine" ], ProteinTranslation.Proteins("UCG"));
}

@test:Config
function tyrosineRnaSequence_1() {
    test:assertEquals([ "Tyrosine" ], ProteinTranslation.Proteins("UAU"));
}

@test:Config
function tyrosineRnaSequence_2() {
    test:assertEquals([ "Tyrosine" ], ProteinTranslation.Proteins("UAC"));
}

@test:Config
function cysteineRnaSequence_1() {
    test:assertEquals([ "Cysteine" ], ProteinTranslation.Proteins("UGU"));
}

@test:Config
function cysteineRnaSequence_2() {
    test:assertEquals([ "Cysteine" ], ProteinTranslation.Proteins("UGC"));
}

@test:Config
function tryptophanRnaSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGG"));
}

@test:Config
function stopCodonRnaSequence_1() {
    Assert.Empty(ProteinTranslation.Proteins("UAA"));
}

@test:Config
function stopCodonRnaSequence_2() {
    Assert.Empty(ProteinTranslation.Proteins("UAG"));
}

@test:Config
function stopCodonRnaSequence_3() {
    Assert.Empty(ProteinTranslation.Proteins("UGA"));
}

@test:Config
function sequenceOfTwoProteinCodonsTranslatesIntoProteins() {
    test:assertEquals([ "Phenylalanine", "Phenylalanine" ], ProteinTranslation.Proteins("UUUUUU"));
}

@test:Config
function sequenceOfTwoDifferentProteinCodonsTranslatesIntoProteins() {
    test:assertEquals([ "Leucine", "Leucine" ], ProteinTranslation.Proteins("UUAUUG"));
}

@test:Config
function translateRnaStrandIntoCorrectProteinList() {
    test:assertEquals([ "Methionine", "Phenylalanine", "Tryptophan" ], ProteinTranslation.Proteins("AUGUUUUGG"));
}

@test:Config
function translationStopsIfStopCodonAtBeginningOfSequence() {
    Assert.Empty(ProteinTranslation.Proteins("UAGUGG"));
}

@test:Config
function translationStopsIfStopCodonAtEndOfTwoCodonSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGGUAG"));
}

@test:Config
function translationStopsIfStopCodonAtEndOfThreeCodonSequence() {
    test:assertEquals([ "Methionine", "Phenylalanine" ], ProteinTranslation.Proteins("AUGUUUUAA"));
}

@test:Config
function translationStopsIfStopCodonInMiddleOfThreeCodonSequence() {
    test:assertEquals([ "Tryptophan" ], ProteinTranslation.Proteins("UGGUAGUGG"));
}

@test:Config
function translationStopsIfStopCodonInMiddleOfSixCodonSequence() {
    test:assertEquals([ "Tryptophan", "Cysteine", "Tyrosine" ], ProteinTranslation.Proteins("UGGUGUUAUUAAUGGUUU"));
}
