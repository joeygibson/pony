use "time"

primitive Imperative
    fun fib(n: U64): U64 =>
        if (n == 0) then
            0
        elseif (n == 1) then
            1
        else 
            fib(n - 1) + fib(n - 2)
        end

// non-tail-recursive, with pattern matching
primitive Functional
    fun fib(n: U64): U64 =>
        match n
            | 0 => 0
            | 1 => 1
            else fib(n - 1) + fib(n - 2)
        end

// tail-recursive, with pattern matching
primitive TailRecursive
    fun fib(n: U64): U64 =>
        _fib_iter(n, 0, 1)

    fun _fib_iter(n: U64, result: U64, next: U64): U64 =>
        match n
            | 0 => result
            else _fib_iter(n - 1, next, result + next)
        end

actor Main
    new create(env: Env) =>
        let resi = Imperative.fib(37)
        let resf = Functional.fib(37)
        let rest = TailRecursive.fib(37)

        env.out.print("Imp: " + resi.string())
        env.out.print("Fun: " + resf.string())
        env.out.print("FTR: " + rest.string())

        (let sec, let nsec) = Time.now()
        let date = Date(sec, nsec)
        env.out.print(date.format("%a, %d %b %Y %T %z"))
        env.out.print(Date(sec, nsec).format("%a, %d %b %Y %T %z"))
