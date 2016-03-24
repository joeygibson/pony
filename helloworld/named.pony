trait Named
  fun name(): String => "Bob"

interface HasName
  fun name(): String

// Bob provides Named, and HasName
class Bob is Named

// Larry provides HasName, because it has the name function, but not Named
class Larry
  fun name(): String = "Larry"
