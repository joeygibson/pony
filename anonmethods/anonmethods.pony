use "collections"

actor Main
    new create(env: Env) =>
        let listOfNumbers = List[U32].from([1; 2; 3; 4])
        let filteringLambda = {(n: U32): Bool => n % 2 == 1}

        let onlyOdd = listOfNumbers.filter(filteringLambda).values()

        for num in onlyOdd do
            env.out.print(num.string())
        end

        

