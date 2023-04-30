import ballerina/test;

@test:Config
function emptyStrands() {
    test:assertEquals(0, Hamming.Distance("", ""));
}

@test:Config
function singleLetterIdenticalStrands() {
    test:assertEquals(0, Hamming.Distance("A", "A"));
}

@test:Config
function singleLetterDifferentStrands() {
    test:assertEquals(1, Hamming.Distance("G", "T"));
}

@test:Config
function longIdenticalStrands() {
    test:assertEquals(0, Hamming.Distance("GGACTGAAATCTG", "GGACTGAAATCTG"));
}

@test:Config
function longDifferentStrands() {
    test:assertEquals(9, Hamming.Distance("GGACGGATTCTG", "AGGACGGATTCT"));
}

@test:Config
function disallowFirstStrandLonger() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("AATG", "AAA"));
}

@test:Config
function disallowSecondStrandLonger() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("ATA", "AGTG"));
}

@test:Config
function disallowEmptyFirstStrand() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("", "G"));
}

@test:Config
function disallowEmptySecondStrand() {
    Assert.Throws<ArgumentException>(() => Hamming.Distance("G", ""));
}
