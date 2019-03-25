actor Aardvark
    let name: String
    var _hunger_level: U64

    new create(name': String) =>
        name = name'
        _hunger_level = 0

    be eat(amount: U64) =>
        _hunger_level = _hunger_level - amount.min(_hunger_level)

actor Main
    new create(env: Env) =>
        call_me_later(env)
        env.out.print("this is printed first")

    fun call_me_later(env: Env) =>
        env.out.print("this is called last")