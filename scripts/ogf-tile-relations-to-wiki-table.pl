while( <STDIN> )
{
	if( /relation id=\"(\d+)\"/ )
	{
		$relation = $1;
	}
	elsif( /<tag k=\"name\" v=\"(..)\"\/>/ )
	{
		$relations{$1} = $relation;
	}
}

print "{| class=\"wikitable\"\n";

for my $n ( 'J' .. 'S' )
{
	print "|-\n";
	for my $e ('A' .. 'H')
	{
		if( exists $relations{"$e$n"} )
		{
			my $relation = $relations{"$e$n"};
			print "| [https://opengeofiction.net/relation/$relation $e$n]\n";
		}
		else
		{
			print "| <!-- $e$n -->\n";
		}
	}
}
print "|}\n";
