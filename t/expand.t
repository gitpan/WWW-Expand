use Test::More;
use strictures 1;
use WWW::Expand;

my @shorteners = (
    GitHub  => 'http://git.io/4YRefw'          => 'https://github.com/GlitchMr/WWW-Expand',
    Google  => 'http://goo.gl/m1KGK'           => 'http://glitchmr.github.com/',
    BitLy   => 'http://bit.ly/E4uzk'           => 'http://perl6.org/',
    IsGd    => 'http://is.gd/5CYCZ6'           => 'http://doc.perl6.org/',
    OwLy    => 'http://ow.ly/fI2Jo'            => 'http://rosettacode.org/wiki/Rosetta_Code',
    URLchen => 'http://urlchen.de/F4Fl4'       => 'http://urlchen.de/',
    HTTPS   => 'http://github.com/'            => 'https://github.com/',
    Perl    => 'http://p3rl.org/WWW::Expand'   => 'https://metacpan.org/module/WWW::Expand',
    Nothing => 'http://glitchmr.github.com/'   => 'http://glitchmr.github.com/',
    Unknown => 'irc://chat.freenode.net/perl6' => 'irc://chat.freenode.net/perl6',
    NotURL  => 'that ain\'t url!'              => 'that%20ain\'t%20url!',
);

plan tests => @shorteners / 3;

while (@shorteners) {
    my ($service, $link, $result) = splice @shorteners, 0, 3;
    is expand($link), $result, $service;
}
