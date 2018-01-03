use "lib:cbffi"

class Foo
    let prefix: String
    let env: Env

    new create(e: Env, p: String) =>
        prefix = p
        env = e

    fun display(msg: Pointer[U8]) =>
        env.out.print(prefix + ":" + String.copy_cstring(msg))

actor Main
    new create(env: Env) =>
        let foo = Foo(env, "From Pony")
        @do_callback[None](addressof foo.display, foo)
        