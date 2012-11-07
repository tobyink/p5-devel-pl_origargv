use Test::More tests => 3;
BEGIN { use_ok('Devel::PL_origargv') };

my ($pl) = Devel::PL_origargv->get;
like $pl, qr{perl}i;

my $argc = Devel::PL_origargv->get;
ok $argc > 1;
