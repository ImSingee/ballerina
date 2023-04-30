import ballerina/test;

@test:Config
function emptyStrand() {
    var expected = new Dictionary<char, int>
    {
        ['A'] = 0,
        ['C'] = 0,
        ['G'] = 0,
        ['T'] = 0
    };
    test:assertEquals(expected, NucleotideCount.Count(""));
}

@test:Config
function canCountOneNucleotideInSingleCharacterInput() {
    var expected = new Dictionary<char, int>
    {
        ['A'] = 0,
        ['C'] = 0,
        ['G'] = 1,
        ['T'] = 0
    };
    test:assertEquals(expected, NucleotideCount.Count("G"));
}

@test:Config
function strandWithRepeatedNucleotide() {
    var expected = new Dictionary<char, int>
    {
        ['A'] = 0,
        ['C'] = 0,
        ['G'] = 7,
        ['T'] = 0
    };
    test:assertEquals(expected, NucleotideCount.Count("GGGGGGG"));
}

@test:Config
function strandWithMultipleNucleotides() {
    var expected = new Dictionary<char, int>
    {
        ['A'] = 20,
        ['C'] = 12,
        ['G'] = 17,
        ['T'] = 21
    };
    test:assertEquals(expected, NucleotideCount.Count("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"));
}

@test:Config
function strandWithInvalidNucleotides() {
    Assert.Throws<ArgumentException>(() => NucleotideCount.Count("AGXXACT"));
}
