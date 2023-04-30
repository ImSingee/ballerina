import ballerina/test;

@test:Config
function fly() {
    var expected = 
        "I know an old lady who swallowed a fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(1));
}

@test:Config
function spider() {
    var expected = 
        "I know an old lady who swallowed a spider.\n" +
        "It wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(2));
}

@test:Config
function bird() {
    var expected = 
        "I know an old lady who swallowed a bird.\n" +
        "How absurd to swallow a bird!\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(3));
}

@test:Config
function cat() {
    var expected = 
        "I know an old lady who swallowed a cat.\n" +
        "Imagine that, to swallow a cat!\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(4));
}

@test:Config
function dog() {
    var expected = 
        "I know an old lady who swallowed a dog.\n" +
        "What a hog, to swallow a dog!\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(5));
}

@test:Config
function goat() {
    var expected = 
        "I know an old lady who swallowed a goat.\n" +
        "Just opened her throat and swallowed a goat!\n" +
        "She swallowed the goat to catch the dog.\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(6));
}

@test:Config
function cow() {
    var expected = 
        "I know an old lady who swallowed a cow.\n" +
        "I don't know how she swallowed a cow!\n" +
        "She swallowed the cow to catch the goat.\n" +
        "She swallowed the goat to catch the dog.\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(7));
}

@test:Config
function horse() {
    var expected = 
        "I know an old lady who swallowed a horse.\n" +
        "She's dead, of course!";
    test:assertEquals(expected, FoodChain.Recite(8));
}

@test:Config
function multipleVerses() {
    var expected = 
        "I know an old lady who swallowed a fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a spider.\n" +
        "It wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a bird.\n" +
        "How absurd to swallow a bird!\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.";
    test:assertEquals(expected, FoodChain.Recite(1, 3));
}

@test:Config
function fullSong() {
    var expected = 
        "I know an old lady who swallowed a fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a spider.\n" +
        "It wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a bird.\n" +
        "How absurd to swallow a bird!\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a cat.\n" +
        "Imagine that, to swallow a cat!\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a dog.\n" +
        "What a hog, to swallow a dog!\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a goat.\n" +
        "Just opened her throat and swallowed a goat!\n" +
        "She swallowed the goat to catch the dog.\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a cow.\n" +
        "I don't know how she swallowed a cow!\n" +
        "She swallowed the cow to catch the goat.\n" +
        "She swallowed the goat to catch the dog.\n" +
        "She swallowed the dog to catch the cat.\n" +
        "She swallowed the cat to catch the bird.\n" +
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
        "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die.\n" +
        "\n" +
        "I know an old lady who swallowed a horse.\n" +
        "She's dead, of course!";
    test:assertEquals(expected, FoodChain.Recite(1, 8));
}
