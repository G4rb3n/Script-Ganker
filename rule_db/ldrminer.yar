// LDRMiner脚本通配规则
rule linux_miner_ldrminer_script_gen
{
   meta:
      description = "ldrminer script general"
      author = "G4rb3n"
      date = "2021-1-7"
      md5_2101 = "236D7925CFAFC1F643BABDB8E48966BF"

   strings:
      $s1 = "cc='"
      $s2 = "get() {"
      $s3 = "php -r" 
      $s4 = "not my proc, kill $pid"
      $s5 = "downloading xmr"
      $s6 = "no sysrv runing"
      $s7 = "$(getconf LONG_BIT)"

      $x1 = "sysrv|network01"
      $x2 = "./network01"
      $x3 = "./sysrv"
      $x4 = "185.239.242.71"

   condition:
      ( filesize < 20KB ) and ( ( 4 of ($s*) ) and ( 1 of ($x*) ) )
}