import ballerina/test;

@test:Config
function verseOneTheHouseThatJackBuilt() {
    var expected = "This is the house that Jack built.";
    test:assertEquals(expected, House.Recite(1));
}

@test:Config
function verseTwoTheMaltThatLay() {
    var expected = "This is the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(2));
}

@test:Config
function verseThreeTheRatThatAte() {
    var expected = "This is the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(3));
}

@test:Config
function verseFourTheCatThatKilled() {
    var expected = "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(4));
}

@test:Config
function verseFiveTheDogThatWorried() {
    var expected = "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(5));
}

@test:Config
function verseSixTheCowWithTheCrumpledHorn() {
    var expected = "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(6));
}

@test:Config
function verseSevenTheMaidenAllForlorn() {
    var expected = "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(7));
}

@test:Config
function verseEightTheManAllTatteredAndTorn() {
    var expected = "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(8));
}

@test:Config
function verseNineThePriestAllShavenAndShorn() {
    var expected = "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(9));
}

@test:Config
function verse_10TheRoosterThatCrowedInTheMorn() {
    var expected = "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(10));
}

@test:Config
function verse_11TheFarmerSowingHisCorn() {
    var expected = "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(11));
}

@test:Config
function verse_12TheHorseAndTheHoundAndTheHorn() {
    var expected = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(12));
}

@test:Config
function multipleVerses() {
    var expected = 
        "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(4, 8));
}

@test:Config
function fullRhyme() {
    var expected = 
        "This is the house that Jack built.\n" +
        "This is the malt that lay in the house that Jack built.\n" +
        "This is the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n" +
        "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
    test:assertEquals(expected, House.Recite(1, 12));
}
