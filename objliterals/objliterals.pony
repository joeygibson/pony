use "collections"

class Foo
    fun foo(str: String): Hashable =>
        object is Hashable
            // let s: String = str
            fun apply(): String => str
            fun hash(): U64 => str.hash()
            fun string(): String => str
        end

class CaptureFromLexicalScope
    new create(env: Env) =>
        foo({(s: String)(env) => env.out.print(s)})

    fun foo(f: {(String)}) =>
        f("Hello, World!")

actor Main
    new create(env: Env) =>
        let f = Foo.foo("foo")
        // env.out.print("V: " + f())