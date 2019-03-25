actor Main
    fun tuples() => 
        // tuples
        var x: (String, U64)
        x = ("test", 23)

        (var y, var z) = x

        var y' = x._1
        var z' = x._2

    fun unions() =>
        var x: (String | None)
        x = "foo"
        x = None
        // x = 23

    fun intersections() => 
        

    new create(env: Env) =>
        tuples()
        unions()
