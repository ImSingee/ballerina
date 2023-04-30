import ballerina/test;

@test:Config
function octal_1IsDecimal_1() {
    test:assertEquals(1, Octal.ToDecimal("1"));
}

@test:Config
function octal_10IsDecimal_8() {
    test:assertEquals(8, Octal.ToDecimal("10"));
}

@test:Config
function octal_17IsDecimal_15() {
    test:assertEquals(15, Octal.ToDecimal("17"));
}

@test:Config
function octal_11IsDecimal_9() {
    test:assertEquals(9, Octal.ToDecimal("11"));
}

@test:Config
function octal_130IsDecimal_88() {
    test:assertEquals(88, Octal.ToDecimal("130"));
}

@test:Config
function octal_2047IsDecimal_1063() {
    test:assertEquals(1063, Octal.ToDecimal("2047"));
}

@test:Config
function octal_7777IsDecimal_4095() {
    test:assertEquals(4095, Octal.ToDecimal("7777"));
}

@test:Config
function octal_1234567IsDecimal_342391() {
    test:assertEquals(342391, Octal.ToDecimal("1234567"));
}

@test:Config
function octal_011IsDecimal_9() {
    test:assertEquals(9, Octal.ToDecimal("011"));
}

@test:Config
function octalCarrotIsDecimal_0() {
    test:assertEquals(0, Octal.ToDecimal("carrot"));
}

@test:Config
function octal_8IsDecimal_0() {
    test:assertEquals(0, Octal.ToDecimal("8"));
}

@test:Config
function octal_9IsDecimal_0() {
    test:assertEquals(0, Octal.ToDecimal("9"));
}

@test:Config
function octal_6789IsDecimal_0() {
    test:assertEquals(0, Octal.ToDecimal("6789"));
}

@test:Config
function octalAbc1zIsDecimal_0() {
    test:assertEquals(0, Octal.ToDecimal("abc1z"));
}
