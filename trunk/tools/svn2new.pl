my $r = shift or die "Usage: perl svn2new.pl STARTING_SVN_REVISION\n";
my @i = `svn log -qv -r $r:HEAD ../asma`;
my (%a, %d);
for (@i) {
	if (m{^   A /trunk/asma/(\S+\.sap)(?: \(from /trunk/asma/(\S+\.sap)\))?}) {
		$a{$1} = 1 if !$2 || delete $a{$2};
	}
	elsif (m{^   D /trunk/asma/(\S+\.sap)}) {
		$d{$1} = 1;
		delete $a{$1};
	}
}
open F, ">new.txt" or die;
print F "$_\n" for sort keys %a;
open F, ">deleted.txt" or die;
print F "$_\n" for sort keys %d;
printf "New: %d Deleted: %d\n", scalar %a, scalar %d;
