class Foo
    var n: U32 = 5

    fun ref set(m: U32) =>
        n = m

    fun print(env: Env) =>
        env.out.print(n.string())

actor Doer
    be do1(env: Env, n: Foo iso) =>
        n.print(env)

actor Main
    new create(env: Env) =>
        let a = Doer
        // let b = Foo

        // won't compile, due to aliasing
        // a.do1(env, b)

        // Passing the result of the `create` will make it work
        // a.do1(env, Foo)

        // If we need an initial reference, we need to `consume` it when passing it
        let b = Foo
        b.set(23)

        a.do1(env, consume b)
        // b.set(99) // The `b` var is now unusable, since its value has been `consume`d
        