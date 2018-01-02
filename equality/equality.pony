class Foo
    let _a: String

    new create(a: String) =>
        _a = a

    fun eq(that: box->Foo): Bool =>
        this._a == that._a

actor Main
    new create(env: Env) =>
        let a = Foo("hi")
        let b = Foo("bye")
        let c = Foo("hi")

        if a == b then
            // won't print
            env.out.print("1")
        end

        if a == c then
            env.out.print("2")
        end

        if a is c then
            // won't print
            env.out.print("3")
        end
        