class Coord
    var _x: U32
    var _y: U32

    new create(x: U32 = 0, y: U32 = 0) => 
        _x = x
        _y = y

    fun string(): String =>
        "(" + _x.string() + ", " + _y.string() + ")"

    // Example of chaining method calls
    fun print_both_vales(out: StdStream) =>
        out.>print(_x.string()).>print(_y.string())

actor Main
    new create(env: Env) =>
        let c = Coord.create(where y = 4, x = 3)
        env.out.print(c.string())
        c.print_both_vales(env.out)
