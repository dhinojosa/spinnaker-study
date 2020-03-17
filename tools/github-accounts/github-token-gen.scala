val names = Map(
   "profound-wagon" -> "762bd0d6cb55d240befa7f815a74b81ac64aa06f",
   "internal-chance" -> "587fcfdfa64748405f4332483bcd4827ac1784df",
   "chronic-summit" -> "1360eb9a757afa2ccbf0eafc759e3e83def10aa4",
   "plausible-chin" -> "19510e79d685214a9b4c328bcbec6d93f58d35d1",
   "glorious-commonwealth" -> "8ca08cbdf937d2b904ceece7a00eafb31ec8f119",
   "autonomous-sandwich" -> "c0c532f51b3cba835ea807a482938b4e6a9474e5"
)


names.foreach{case (k,v) => 
  println(s"echo \'$v\' >> ~/${k}-token-file.txt")
  println(s"TOKEN_FILE=~/${k}-token_file.txt")
  println(s"ARTIFACT_ACCOUNT_NAME=${k}-account")
  println("hal config artifact github account add $ARTIFACT_ACCOUNT_NAME --token-file $TOKEN_FILE")
}
