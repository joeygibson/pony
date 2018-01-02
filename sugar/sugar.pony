class Foo
    let _a: String

    new create(a: String) =>
        _a = a

    fun apply(): String =>
        "My value is: " + _a

    fun eq(that: box->Foo): Bool =>
        this._a == that._a

class CreateAndApplySugar
    let _a: String

    new create() =>
        _a = "Sugary"

    fun apply(): String =>
        "My value is " + _a

actor Main
    new create(env: Env) =>
        let a = Foo("hi")
        
        env.out.print(a.apply())
        env.out.print(a())

        let b = Foo.create("foo")
        env.out.print(b.apply())
        env.out.print(b())

        env.out.print(CreateAndApplySugar())
