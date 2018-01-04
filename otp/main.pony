use "collections"
use "debug"

interface GenEventHandler[T: Any #send]
    fun box name(): String
    be handle(data: T!)

actor GenEvent[T: Any #send]
    var subscribers: List[GenEventHandler[T] iso!]

    new create() =>
        subscribers = List[GenEventHandler[T] iso!]

    be subscribe(handler: GenEventHandler[T] tag) =>
        subscribers.push(consume handler)

    be push(data: T!) =>
        for subscriber in subscribers.values() do
            let data' = data
            subscriber.handle(consume data')
        end

actor StringEventHandler is GenEventHandler[String]
    let _name: String

    new create(name': String) =>
        _name = name'

    fun box name(): String =>
        _name

    be handle(data: String) =>
        Debug.out("String: " + data + " received by handler " + name())

actor Main
    let gen_event: GenEvent[String]

    new create(env: Env) =>
        gen_event = GenEvent[String]

        let foo = StringEventHandler("foo")
        let bar = StringEventHandler("bar")

        gen_event.subscribe(foo)
        gen_event.subscribe(bar)

        let x = "Hello, World! 2"

        gen_event.>push("Hello, World!")
            .>push("Second line!")
            .push("Third line!")

        