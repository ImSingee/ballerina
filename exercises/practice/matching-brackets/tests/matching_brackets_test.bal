import ballerina/test;

@test:Config
function pairedSquareBrackets() {
    var value = "[]";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function emptyString() {
    var value = "";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function unpairedBrackets() {
    var value = "[[";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function wrongOrderedBrackets() {
    var value = "}{";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function wrongClosingBracket() {
    var value = "{]";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function pairedWithWhitespace() {
    var value = "{ }";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function partiallyPairedBrackets() {
    var value = "{[])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function simpleNestedBrackets() {
    var value = "{[]}";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function severalPairedBrackets() {
    var value = "{}[]";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function pairedAndNestedBrackets() {
    var value = "([{}({}[])])";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function unopenedClosingBrackets() {
    var value = "{[)][]}";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function unpairedAndNestedBrackets() {
    var value = "([{])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function pairedAndWrongNestedBrackets() {
    var value = "[({]})";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function pairedAndWrongNestedBracketsButInnermostAreCorrect() {
    var value = "[({}])";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function pairedAndIncompleteBrackets() {
    var value = "{}[";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function tooManyClosingBrackets() {
    var value = "[]]";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function earlyUnexpectedBrackets() {
    var value = ")()";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function earlyMismatchedBrackets() {
    var value = "{)()";
    test:assertFalse(MatchingBrackets.IsPaired(value));
}

@test:Config
function mathExpression() {
    var value = "(((185 + 223.85) * 15) - 543)/2";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}

@test:Config
function complexLatexExpression() {
    var value = "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)";
    test:assertTrue(MatchingBrackets.IsPaired(value));
}
