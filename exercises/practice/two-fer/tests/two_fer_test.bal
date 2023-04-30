import ballerina/test;

@test:Config
function noNameGiven() {
    test:assertEquals("One for you, one for me.", TwoFer.Speak());
}

@test:Config
function aNameGiven() {
    test:assertEquals("One for Alice, one for me.", TwoFer.Speak("Alice"));
}

@test:Config
function anotherNameGiven() {
    test:assertEquals("One for Bob, one for me.", TwoFer.Speak("Bob"));
}
