import ballerina/test;

@test:Config
function yearNotDivisibleBy_4InCommonYear() {
    test:assertFalse(Leap.IsLeapYear(2015));
}

@test:Config
function yearDivisibleBy_2NotDivisibleBy_4InCommonYear() {
    test:assertFalse(Leap.IsLeapYear(1970));
}

@test:Config
function yearDivisibleBy_4NotDivisibleBy_100InLeapYear() {
    test:assertTrue(Leap.IsLeapYear(1996));
}

@test:Config
function yearDivisibleBy_4And_5IsStillALeapYear() {
    test:assertTrue(Leap.IsLeapYear(1960));
}

@test:Config
function yearDivisibleBy_100NotDivisibleBy_400InCommonYear() {
    test:assertFalse(Leap.IsLeapYear(2100));
}

@test:Config
function yearDivisibleBy_100ButNotBy_3IsStillNotALeapYear() {
    test:assertFalse(Leap.IsLeapYear(1900));
}

@test:Config
function yearDivisibleBy_400IsLeapYear() {
    test:assertTrue(Leap.IsLeapYear(2000));
}

@test:Config
function yearDivisibleBy_400ButNotBy_125IsStillALeapYear() {
    test:assertTrue(Leap.IsLeapYear(2400));
}

@test:Config
function yearDivisibleBy_200NotDivisibleBy_400InCommonYear() {
    test:assertFalse(Leap.IsLeapYear(1800));
}
