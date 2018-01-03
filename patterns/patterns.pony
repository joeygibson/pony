type Data is (U32 | String | None)

actor Main
    new create(env: Env) =>
        let x: U32 = 2
        let res = match x
            | 1 => "one"
            | 2 => "two"
            else "3"
        end

        env.out.print("Res: " + res)

        let y: Data = 23
        // "Foo"
        let res1 = match y
            | None => "None"
            | 1 => "One"
            | let u: U32 => "A number that isn't 1: " + u.string()
            | let s: String => "A string: " + s
        end

        env.out.print("Res1: " + res1)


