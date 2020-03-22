val names = Map(
   "mild-temper" -> "92632b5810d442b81b005573723dd450e85a928d"
)

names.foreach{case (k,v) =>
  println(s"echo \'$v\' >> ~/${k}-token-file.txt")
  println(s"TOKEN_FILE=~/${k}-token-file.txt")
  println(s"ARTIFACT_ACCOUNT_NAME=${k}-account")
  println("hal config artifact github account add $ARTIFACT_ACCOUNT_NAME --token-file $TOKEN_FILE")
}
