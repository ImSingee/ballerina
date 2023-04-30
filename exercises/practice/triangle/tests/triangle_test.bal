import ballerina/test;

@test:Config
function equilateralTriangleAllSidesAreEqual() {
    test:assertTrue(Triangle.IsEquilateral(2, 2, 2));
}

@test:Config
function equilateralTriangleAnySideIsUnequal() {
    test:assertFalse(Triangle.IsEquilateral(2, 3, 2));
}

@test:Config
function equilateralTriangleNoSidesAreEqual() {
    test:assertFalse(Triangle.IsEquilateral(5, 4, 6));
}

@test:Config
function equilateralTriangleAllZeroSidesIsNotATriangle() {
    test:assertFalse(Triangle.IsEquilateral(0, 0, 0));
}

@test:Config
function equilateralTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsEquilateral(0.5, 0.5, 0.5));
}

@test:Config
function isoscelesTriangleLastTwoSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(3, 4, 4));
}

@test:Config
function isoscelesTriangleFirstTwoSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(4, 4, 3));
}

@test:Config
function isoscelesTriangleFirstAndLastSidesAreEqual() {
    test:assertTrue(Triangle.IsIsosceles(4, 3, 4));
}

@test:Config
function isoscelesTriangleEquilateralTrianglesAreAlsoIsosceles() {
    test:assertTrue(Triangle.IsIsosceles(4, 4, 4));
}

@test:Config
function isoscelesTriangleNoSidesAreEqual() {
    test:assertFalse(Triangle.IsIsosceles(2, 3, 4));
}

@test:Config
function isoscelesTriangleFirstTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(1, 1, 3));
}

@test:Config
function isoscelesTriangleSecondTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(1, 3, 1));
}

@test:Config
function isoscelesTriangleThirdTriangleInequalityViolation() {
    test:assertFalse(Triangle.IsIsosceles(3, 1, 1));
}

@test:Config
function isoscelesTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsIsosceles(0.5, 0.4, 0.5));
}

@test:Config
function scaleneTriangleNoSidesAreEqual() {
    test:assertTrue(Triangle.IsScalene(5, 4, 6));
}

@test:Config
function scaleneTriangleAllSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 4, 4));
}

@test:Config
function scaleneTriangleFirstAndSecondSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 4, 3));
}

@test:Config
function scaleneTriangleFirstAndThirdSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(3, 4, 3));
}

@test:Config
function scaleneTriangleSecondAndThirdSidesAreEqual() {
    test:assertFalse(Triangle.IsScalene(4, 3, 3));
}

@test:Config
function scaleneTriangleMayNotViolateTriangleInequality() {
    test:assertFalse(Triangle.IsScalene(7, 3, 2));
}

@test:Config
function scaleneTriangleSidesMayBeFloats() {
    test:assertTrue(Triangle.IsScalene(0.5, 0.4, 0.6));
}
