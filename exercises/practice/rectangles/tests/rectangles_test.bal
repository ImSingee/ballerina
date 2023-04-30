import ballerina/test;

@test:Config
function noRows() {
    var strings = Array.Empty<string>();
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config
function noColumns() {
    var strings = new[]
    {
        ""
    };
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config
function noRectangles() {
    var strings = new[]
    {
        " "
    };
    test:assertEquals(0, Rectangles.Count(strings));
}

@test:Config
function oneRectangle() {
    var strings = new[]
    {
        "+-+",
        "| |",
        "+-+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config
function twoRectanglesWithoutSharedParts() {
    var strings = new[]
    {
        "  +-+",
        "  | |",
        "+-+-+",
        "| |  ",
        "+-+  "
    };
    test:assertEquals(2, Rectangles.Count(strings));
}

@test:Config
function fiveRectanglesWithSharedParts() {
    var strings = new[]
    {
        "  +-+",
        "  | |",
        "+-+-+",
        "| | |",
        "+-+-+"
    };
    test:assertEquals(5, Rectangles.Count(strings));
}

@test:Config
function rectangleOfHeight_1IsCounted() {
    var strings = new[]
    {
        "+--+",
        "+--+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config
function rectangleOfWidth_1IsCounted() {
    var strings = new[]
    {
        "++",
        "||",
        "++"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config
function number_1x1SquareIsCounted() {
    var strings = new[]
    {
        "++",
        "++"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config
function onlyCompleteRectanglesAreCounted() {
    var strings = new[]
    {
        "  +-+",
        "    |",
        "+-+-+",
        "| | -",
        "+-+-+"
    };
    test:assertEquals(1, Rectangles.Count(strings));
}

@test:Config
function rectanglesCanBeOfDifferentSizes() {
    var strings = new[]
    {
        "+------+----+",
        "|      |    |",
        "+---+--+    |",
        "|   |       |",
        "+---+-------+"
    };
    test:assertEquals(3, Rectangles.Count(strings));
}

@test:Config
function cornerIsRequiredForARectangleToBeComplete() {
    var strings = new[]
    {
        "+------+----+",
        "|      |    |",
        "+------+    |",
        "|   |       |",
        "+---+-------+"
    };
    test:assertEquals(2, Rectangles.Count(strings));
}

@test:Config
function largeInputWithManyRectangles() {
    var strings = new[]
    {
        "+---+--+----+",
        "|   +--+----+",
        "+---+--+    |",
        "|   +--+----+",
        "+---+--+--+-+",
        "+---+--+--+-+",
        "+------+  | |",
        "          +-+"
    };
    test:assertEquals(60, Rectangles.Count(strings));
}

@test:Config
function rectanglesMustHaveFourSides() {
    var strings = new[]
    {
        "+-+ +-+",
        "| | | |",
        "+-+-+-+",
        "  | |  ",
        "+-+-+-+",
        "| | | |",
        "+-+ +-+"
    };
    test:assertEquals(5, Rectangles.Count(strings));
}
