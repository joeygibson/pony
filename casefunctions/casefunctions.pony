use "collections"

primitive Factorial
    fun fac_conditional(n: U64): U64 =>
        if n == 0 then
            1
        else
            n * fac_conditional(n - 1)
        end

    // dispatch based on argument match
    fun fac_case(0): U64 => 1
    fun fac_case(n: U64): U64 ? => n * (fac_case(n - 1)? as U64)

    // dispatch based on guard function
    fun fac_guard(n: U64): U64 if n == 0 => 1
    fun fac_guard(n: U64): U64 ? => n * (fac_guard(n - 1)? as U64)

class FizzBuzz
    // case functions for FizzBuzz
    fun _fizz_buzz(_, 0, 0): String => "FizzBuzz"
    fun _fizz_buzz(_, 0, b: U64): String => "Fizz"
    fun _fizz_buzz(_, f: U64, 0): String => "Buzz"
    fun _fizz_buzz(x: U64, _, _): String => x.string()

    // parameters are different, return types are different
    fun fizz_buzz(x: U64): String ? => _fizz_buzz(x, x % 3, x % 5) as String
    fun fizz_buzz(x: Range[U64]): Array[String] ? => 
        let acc = Array[String]

        for z in x do
            acc.push(fizz_buzz(z)? as String)
        end

actor Main
    new create(env: Env) =>
        let n: U64 = try
            env.args(1)?.read_int[U64]()?._1
        else
            13
        end

        try
            env.out.print(n.string().add("! = ")
                .add(Factorial.fac_conditional(n).string()))
            env.out.print(n.string().add("! = ")
                .add((Factorial.fac_case(n)? as U64).string()))
            env.out.print(n.string().add("! = ")
                .add((Factorial.fac_guard(n)? as U64).string()))
        end

        try
            for x in Range[U64](1, 101) do
                env.out.print(FizzBuzz.fizz_buzz(x)? as String)
            end

            let lines = FizzBuzz.fizz_buzz(Range[U64](1, 101))? as Array[String]
            env.out.print("\n".join(lines.values()))
        end
