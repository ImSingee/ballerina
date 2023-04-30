import ballerina/test;

@test:Config
function residentWhoDrinksWater() {
    test:assertEquals(Nationality.Norwegian, ZebraPuzzle.DrinksWater());
}

@test:Config
function residentWhoOwnsZebra() {
    test:assertEquals(Nationality.Japanese, ZebraPuzzle.OwnsZebra());
}
