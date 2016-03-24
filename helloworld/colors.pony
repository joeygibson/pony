// primitive Red
// primitive Green
// primitive Blue

// Can also be declared like C constants
primitive Red   fun apply(): U32 => 0xFF0000FF
primitive Green  fun apply(): U32 => 0x00FF00FF
primitive Blue fun apply(): U32 => 0x0000FFFF

// Can be namespaced:
// primitive Colors
//   fun red(): U32 => 0xFF0000FF
//   fun green(): U32 => 0x00FF00FF
//   fun blue(): U32 => 0x0000FFFF

type Color is (Red | Blue | Green)  // This is a union datatype; the thing is one of these

primitive ColorList
  fun tag apply(): Array[Color] =>
    [Red, Green, Blue]

for color in ColorList().values() do
  // stuff
end

// complex datatypes work for traits, too
interface HasName
  fun name(): String

interface HasAge
  fun age(): U32

interface HasAddress
  fun address(): String

type Person is (HasName & HasAge & HasAddress)  // an intersection datatype; this thing must have ALL of these
