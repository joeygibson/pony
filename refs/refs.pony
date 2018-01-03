actor Doer
    be do1(n: U32) =>
        None

    // be do2(n: Foo) =>
    be do2(n: Foo val) =>
        None

class Foo
    let n: U32 = 5

actor Main
    new create(env: Env) =>
        let a = Doer

        let n: U32 = 5

        // This compiles
        a.do1(n)

        // This doesn't, because `class` defaults to `ref`
        // Marking `b` as `val` will make it work
        // let b = Foo
        let b: Foo val = Foo.create()
        a.do2(b)
