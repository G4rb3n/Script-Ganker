// z0Miner脚本通配规则
rule linux_miner_runminer_script_gen
{
    meta:
        description = "runminer shell script general"
        author = "G4rb3n"
        reference = "https://s.tencent.com/research/report/1229.html"
        date = "2021-1-20"

   strings:
      $s1 = "zero=0"
      $s2 = "process="
      $s3 = "if [ \"$process\" -eq \"$zero\" ]; then"
      $s4 = "restart crond.service"

      $c1 = "task.sh"
      $c2 = "run.sh"
      $c3 = "/tmp/tcpp"

   condition:
      ( filesize < 10KB ) and ( 2 of ($s*) ) or ( 2 of ($c*) )
}