// class Foo[A: Any val]
//     var _c: A

//     new create(a: A) =>
//         _c = a

//     fun get(): A => _c
//     fun ref set(a: A) => _c = a

//     fun bar[B: Stringable val](a: B): String =>
//         a.string()

class Foo[A]
    var _c: A

    new create(c: A) =>
        _c = consume c

    fun get(): this->A => _c

    fun ref set(c: A) => _c = consume c

actor Main
    new create(env: Env) =>
        let a = Foo[U32](42)

        env.out.print(a.get().string())
        a.set(21)

        env.out.print(a.get().string())
        let b = Foo[F32](1.5)
        env.out.print(b.get().string())

        let c = Foo[String]("Hello")
        env.out.print(c.get().string())

        // let d = a.bar[I32](23)
        // env.out.print(d)

