primitive Factorial
    fun factorial(x: U32, y: U32 = 1): U32 =>
        if x == 0 then
            y
        else
            factorial(x - 1, x * y)
        end

actor Main
    new create(env: Env) =>
        let value = Factorial.factorial(10)
        env.out.print(value.string())