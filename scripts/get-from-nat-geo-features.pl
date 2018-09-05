
my @TYPES = (
    'area',
    'arch',
    'arroyo',
    'bar',
    'basin',
    'bay',
    'beach',
    'bench',
    'bend',
    'cape',
    'channel',
    'cliff',
    'crater',
    'falls',
    'flat',
    'forest',
    'gap',
    'glacier',
    'gut',
    'harbor',
    'island',
    'isthmus',
    'lake',
    'pillar',
    'plain',
    'range',
    'rapids',
    'ridge',
    'slope',
    'spring',
    'stream',
    'summit',
    'swamp',
    'trail',
    'valley',
    'woods');



for( my $n = 0; $n < (@TYPES * 3); $n++ )
{
	my $number = int (rand 300) + 1;
	my $type = $TYPES[int rand @TYPES];	
	
	open my $in, "curl \"https://www.mithrilandmages.com/utilities/FeatureNames.php\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0\" -H \"Accept: */*\" -H \"Accept-Language: en-GB,en;q=0.5\" --compressed -H \"Referer: https://www.mithrilandmages.com/utilities/FeatureNames.php\" -H \"If-Modified-Since: Sat, 1 Jan 2000 00:00:00 GMT\" -H \"content-type: application/x-www-form-urlencoded\" -H \"Connection: keep-alive\" --data \"xjxfun=generate_names&xjxr=1536109233444&xjxargs[]=S$type&xjxargs[]=S$number\" |";
	while( my $line = <$in> )
	{
		next if( $line =~ /CDATA/ );
		if( $line =~ /^(.+)<br\/>/ )
		{
			print "$1\n";
		}
		#print "$line";
	}
}