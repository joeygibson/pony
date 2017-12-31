primitive OpenedDoor
primitive ClosedDoor

type DoorState is (OpenedDoor | ClosedDoor)

primitive BasicMath
    fun add(a: U64, b: U64): U64 => a + b

    fun mul(a: U64, b: U64): U64 => a * b

actor Main
    new create(env: Env) =>
        let doorState: DoorState = ClosedDoor

        let isDoorOpen: Bool = match doorState
            | OpenedDoor => true
            | ClosedDoor => false
        end

        env.out.print("Is door open? " + isDoorOpen.string())
        env.out.print("2 + 3 = " + BasicMath.add(2, 3).string())
