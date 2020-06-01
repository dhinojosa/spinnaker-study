val names = Map(
   "mild-temper" -> "92632b5810d442b81b005573723dd450e85a928d"
)

names.foreach{case (k,v) =>
  println(s"- name: $k")
  println(s"  token: $v")
}
