use LWP::Simple; 
use HTML::Entities;

$URL = 'https://www.behindthename.com/random/random.php?number=2&gender=both&surname=&randomsurname=yes&norare=yes&all=no&usage_cat=1&usage_gal=1&usage_spa=1';
for( $n = 0; $n < 5000; $n++ )
{
	my $website_content = get($URL);
	if( $website_content =~ /<a class=\"plain\" href=\"\/name\/.+\">(.+)<\/a>  <a class=\"plain\" href=\".+\">(.+)<\/a>/ )
	{
		my $encoded_name = "$1 $2";
		my $name = decode_entities($encoded_name);
		print STDERR "$name\n";
		print "$name\n";
		
	}
}
