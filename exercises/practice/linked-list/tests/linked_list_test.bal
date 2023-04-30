import ballerina/test;

@test:Config
function pushAndPopAreFirstInLastOutOrder() {
    var deque = new Deque<int>();
    deque.Push(10);
    deque.Push(20);
    test:assertEquals(20, deque.Pop());
    test:assertEquals(10, deque.Pop());
}

@test:Config
function pushAndShiftAreFirstInFirstOutOrder() {
    var deque = new Deque<int>();
    deque.Push(10);
    deque.Push(20);
    test:assertEquals(10, deque.Shift());
    test:assertEquals(20, deque.Shift());
}

@test:Config
function unshiftAndShiftAreLastInFirstOutOrder() {
    var deque = new Deque<int>();
    deque.Unshift(10);
    deque.Unshift(20);
    test:assertEquals(20, deque.Shift());
    test:assertEquals(10, deque.Shift());
}

@test:Config
function unshiftAndPopAreLastInLastOutOrder() {
    var deque = new Deque<int>();
    deque.Unshift(10);
    deque.Unshift(20);
    test:assertEquals(10, deque.Pop());
    test:assertEquals(20, deque.Pop());
}

@test:Config
function pushAndPopCanHandleMultipleValues() {
    var deque = new Deque<int>();
    deque.Push(10);
    deque.Push(20);
    deque.Push(30);
    test:assertEquals(30, deque.Pop());
    test:assertEquals(20, deque.Pop());
    test:assertEquals(10, deque.Pop());
}

@test:Config
function unshiftAndShiftCanHandleMultipleValues() {
    var deque = new Deque<int>();
    deque.Unshift(10);
    deque.Unshift(20);
    deque.Unshift(30);
    test:assertEquals(30, deque.Shift());
    test:assertEquals(20, deque.Shift());
    test:assertEquals(10, deque.Shift());
}

@test:Config
function allMethodsOfManipulatingTheDequeCanBeUsedTogether() {
    var deque = new Deque<int>();
    deque.Push(10);
    deque.Push(20);
    test:assertEquals(20, deque.Pop());

    deque.Push(30);
    test:assertEquals(10, deque.Shift());

    deque.Unshift(40);
    deque.Push(50);
    test:assertEquals(40, deque.Shift());
    test:assertEquals(50, deque.Pop());
    test:assertEquals(30, deque.Shift());
}