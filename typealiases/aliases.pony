primitive Red fun apply(): U64 => 0xFF0000FF
primitive Green fun apply(): U64 => 0x00FF00FF
primitive Blue fun apply(): U64 => 0x0000FFFF

primitive NamespacedColors
    fun red(): U64 => 0xFF0000FF
    fun green():U64 => 0x00FF00FF

type Colors is (Red | Green | Blue)

primitive ColorList
    fun apply(): Array[Colors] =>
        [Red; Green; Blue]

interface HasName
    fun name(): String

interface HasAge
    fun age(): U32

interface HasAddress
    fun address(): String

type Person is (HasName & HasAge & HasAddress)

actor Main
    new create(env: Env) => 
        // for color in ColorList().values() do
        // end

        env.out.print("Done")
