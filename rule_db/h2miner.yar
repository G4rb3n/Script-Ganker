// H2Miner脚本通配规则
rule linux_miner_h2miner_script_gen
{
    meta:
        description = "h2miner script general"
        author = "G4rb3n"
        reference = "https://mp.weixin.qq.com/s/iNq8SdTZ9IrttAoQYLJw5A"
        date = "2020-7-31"

   strings:
      $s1 = "echo \"P OK\""
      $s2 = "echo \"T DIR $DIR\""
      $s3 = "echo \"No md5sum\""
      $s4 = "echo \"P NOT EXISTS\""
      $s5 = "case $sum in"
      
      $x1 = "ulimit -n 65535"
      $x2 = "https://bitbucket.org"

      $c1 = "kingsing"
      $c2 = "salt-store"
      $c3 = "195.3.146.118"
      $c4 = "217.12.210.192"

   condition:
      ( filesize < 50KB ) and ( ( 4 of ($s*) ) and ( ( 2 of ($x*) ) or ( 2 of ($c*) ) ) )
}