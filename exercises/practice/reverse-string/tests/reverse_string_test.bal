import ballerina/test;

@test:Config
function anEmptyString() {
    test:assertEquals("", ReverseString.Reverse(""));
}

@test:Config
function aWord() {
    test:assertEquals("tobor", ReverseString.Reverse("robot"));
}

@test:Config
function aCapitalizedWord() {
    test:assertEquals("nemaR", ReverseString.Reverse("Ramen"));
}

@test:Config
function aSentenceWithPunctuation() {
    test:assertEquals("!yrgnuh m'I", ReverseString.Reverse("I'm hungry!"));
}

@test:Config
function aPalindrome() {
    test:assertEquals("racecar", ReverseString.Reverse("racecar"));
}

@test:Config
function anEvenSizedWord() {
    test:assertEquals("reward", ReverseString.Reverse("drawer"));
}
