import ballerina/test;

@test:Config
function dataIsRetained() {
    var tree = new BinarySearchTree(4);
    test:assertEquals(4, tree.Value);
}

@test:Config
function smallerNumberAtLeftNode() {
    var tree = new BinarySearchTree([ 4, 2 ]);
    test:assertEquals(4, tree.Value);
    test:assertEquals(2, tree.Left.Value);
}

@test:Config
function sameNumberAtLeftNode() {
    var tree = new BinarySearchTree([ 4, 4 ]);
    test:assertEquals(4, tree.Value);
    test:assertEquals(4, tree.Left.Value);
}

@test:Config
function greaterNumberAtRightNode() {
    var tree = new BinarySearchTree([ 4, 5 ]);
    test:assertEquals(4, tree.Value);
    test:assertEquals(5, tree.Right.Value);
}

@test:Config
function canCreateComplexTree() {
    var tree = new BinarySearchTree([ 4, 2, 6, 1, 3, 5, 7 ]);
    test:assertEquals(4, tree.Value);
    test:assertEquals(2, tree.Left.Value);
    test:assertEquals(1, tree.Left.Left.Value);
    test:assertEquals(3, tree.Left.Right.Value);
    test:assertEquals(6, tree.Right.Value);
    test:assertEquals(5, tree.Right.Left.Value);
    test:assertEquals(7, tree.Right.Right.Value);
}

@test:Config
function canSortSingleNumber() {
    var tree = new BinarySearchTree(2);
    test:assertEquals([ 2 ], tree.AsEnumerable());
}

@test:Config
function canSortIfSecondNumberIsSmallerThanFirst() {
    var tree = new BinarySearchTree([ 2, 1 ]);
    test:assertEquals([ 1, 2 ], tree.AsEnumerable());
}

@test:Config
function canSortIfSecondNumberIsSameAsFirst() {
    var tree = new BinarySearchTree([ 2, 2 ]);
    test:assertEquals([ 2, 2 ], tree.AsEnumerable());
}

@test:Config
function canSortIfSecondNumberIsGreaterThanFirst() {
    var tree = new BinarySearchTree([ 2, 3 ]);
    test:assertEquals([ 2, 3 ], tree.AsEnumerable());
}

@test:Config
function canSortComplexTree() {
    var tree = new BinarySearchTree([ 2, 1, 3, 6, 7, 5 ]);
    test:assertEquals([ 1, 2, 3, 5, 6, 7 ], tree.AsEnumerable());
}