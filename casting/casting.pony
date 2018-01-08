use "json"

interface Critter
    fun wash(): String

class Wombat is Critter
    fun wash(): String => "I'm a clean wombat!"

class Capybara is Critter
    fun wash(): String => "I'm a clearn capybar!"
    fun swim(): String => "Just keep swimming..."

actor Main
    let _env: Env

    new create(env: Env) =>
        _env = env

        first_cast()
        second_cast()

    fun first_cast() =>
        var jsonSum: I64 = 0
        let jd: JsonDoc = JsonDoc

        for arg in _env.args.slice(1).values() do
            try
                jd.parse(arg)?
                jsonSum = jsonSum + (jd.data as I64)
            end
        end

        _env.out.print("Sum: " + jsonSum.string())

    fun second_cast() =>
        let critters = Array[Critter].>push(Wombat).>push(Capybara)

        for critter in critters.values() do
            _env.out.print(critter.wash())

            try
                _env.out.print((critter as Capybara).swim())
            end
        end
