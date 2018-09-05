
for( my $n = 0; $n < 2; $n++ )
{
	my $sex = ($n == 0) ? 'male' : 'female';
	my $number = ($sex eq 'male') ? 500 : 300;
	my $middle = 3;

	open my $in, "curl \"https://www.mithrilandmages.com/utilities/Western.php\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0\" -H \"Accept: */*\" -H \"Accept-Language: en-GB,en;q=0.5\" --compressed -H \"Referer: https://www.mithrilandmages.com/utilities/Western.php\" -H \"If-Modified-Since: Sat, 1 Jan 2000 00:00:00 GMT\" -H \"content-type: application/x-www-form-urlencoded\" -H \"Connection: keep-alive\" --data \"xjxfun=generate_names&xjxr=1536107560664&xjxargs[]=S$sex&xjxargs[]=S$middle&xjxargs[]=S$number\" |";
	while( my $line = <$in> )
	{
		next if( $line =~ /CDATA/ );
		if( $line =~ /^(.+)<br \/>/ )
		{
			print "$1\n";
		}
	}
}