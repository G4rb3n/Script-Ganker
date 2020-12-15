// Chongfu脚本通配规则
rule linux_miner_chongfu_script_gen
{
   meta:
      description = "chongfu script general"
      author = "G4rb3n"
      date = "2020-12-15"
      md5_2006 = "6AA2F548479287C36E5BE91DE27115C3"
      md5_2008 = "BB7CDF5707A857036CD41AF4BAFAED31"
      md5_2008 = "48C910CD9A07404FBFB8BF52847E72C3"
      md5_2008 = "83CAA873CEE081162C417EB8DEC4A351"
      md5_2012 = "AD895B537E6A3C85DD404C213E712E46"

   strings:
      $s1 = "Centos_sshd_killn"
      $s2 = "Welcome like-minded friends to come to exchange"
      $s3 = "We are a group of people who have a dream" 
      $s4 = "2016-06-14"
      $s5 = "qun:10776622"
      $s6 = "echo \"No wget\""
      $s7 = "echo \"No curl\""

      $x1 = "/etc/chongfu.sh"
      $x2 = "222.186.34.56"
      $x3 = "49.235.238.111"
      $x4 = "shell-api.eatuo.com"

   condition:
      ( filesize < 20KB ) and ( ( 4 of ($s*) ) or ( 2 of ($x*) ) )
}