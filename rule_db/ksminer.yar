// ksminer脚本通配规则
rule linux_miner_ksminer_script_gen
{
    meta:
        description = "ksminer shell script general"
        author = "G4rb3n"
        reference = "https://s.tencent.com/research/report/1203.html"
        date = "2020-12-16"

   strings:
      $s1 = "/var/tmp/"
      $s2 = "echo \"creez dir\""
      $s3 = "echo \"Only root may add a user to the system.\""
      $s4 = "mwwie"
      $s5 = "mwwwie"

      $c1 = "144.217.45.47"
      $c2 = ".oznminerv2"
      $c3 = ".syslogs1q"
      $c4 = "ImYouIdiotFuckUrMomy!@#@WS"

   condition:
      ( filesize < 50KB ) and ( 3 of ($s*) ) or ( 2 of ($c*) )
}