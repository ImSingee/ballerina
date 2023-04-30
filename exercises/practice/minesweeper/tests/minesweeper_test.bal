import ballerina/test;

@test:Config
function noRows() {
    var minefield = Array.Empty<string>();
    var expected = Array.Empty<string>();
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function noColumns() {
    var minefield = new[]
    {
        ""
    };
    var expected = new[]
    {
        ""
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function noMines() {
    var minefield = new[]
    {
        "   ",
        "   ",
        "   "
    };
    var expected = new[]
    {
        "   ",
        "   ",
        "   "
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function minefieldWithOnlyMines() {
    var minefield = new[]
    {
        "***",
        "***",
        "***"
    };
    var expected = new[]
    {
        "***",
        "***",
        "***"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function mineSurroundedBySpaces() {
    var minefield = new[]
    {
        "   ",
        " * ",
        "   "
    };
    var expected = new[]
    {
        "111",
        "1*1",
        "111"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function spaceSurroundedByMines() {
    var minefield = new[]
    {
        "***",
        "* *",
        "***"
    };
    var expected = new[]
    {
        "***",
        "*8*",
        "***"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function horizontalLine() {
    var minefield = new[]
    {
        " * * "
    };
    var expected = new[]
    {
        "1*2*1"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function horizontalLineMinesAtEdges() {
    var minefield = new[]
    {
        "*   *"
    };
    var expected = new[]
    {
        "*1 1*"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function verticalLine() {
    var minefield = new[]
    {
        " ",
        "*",
        " ",
        "*",
        " "
    };
    var expected = new[]
    {
        "1",
        "*",
        "2",
        "*",
        "1"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function verticalLineMinesAtEdges() {
    var minefield = new[]
    {
        "*",
        " ",
        " ",
        " ",
        "*"
    };
    var expected = new[]
    {
        "*",
        "1",
        " ",
        "1",
        "*"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function cross() {
    var minefield = new[]
    {
        "  *  ",
        "  *  ",
        "*****",
        "  *  ",
        "  *  "
    };
    var expected = new[]
    {
        " 2*2 ",
        "25*52",
        "*****",
        "25*52",
        " 2*2 "
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}

@test:Config
function largeMinefield() {
    var minefield = new[]
    {
        " *  * ",
        "  *   ",
        "    * ",
        "   * *",
        " *  * ",
        "      "
    };
    var expected = new[]
    {
        "1*22*1",
        "12*322",
        " 123*2",
        "112*4*",
        "1*22*2",
        "111111"
    };
    test:assertEquals(expected, Minesweeper.Annotate(minefield));
}
