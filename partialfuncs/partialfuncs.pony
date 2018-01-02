primitive Factorial
    fun factorial(x: I32): I32 ? =>
        if x < 0 then error end
        if x == 0 then
            1
        else
            x * factorial(x - 1)?
        end

actor Main
    new create(env: Env) =>
        try
            let value = Factorial.factorial(10)?
            env.out.print(value.string())

            env.out.print(Factorial.factorial(-1)?.string())
        else
            env.out.print("Crap")
        end