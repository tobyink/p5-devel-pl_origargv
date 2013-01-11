package Devel::PL_origargv;

use 5.006;
use strict;
use warnings;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.002';

use Inline C => q{
	int _argc () {
		return PL_origargc;
	}
	char* _argv (int x) {
		return PL_origargv[x - 1];
	}
};

sub get {
	return _argc unless wantarray;
	map _argv($_), 1 .. _argc;
}

__PACKAGE__
__END__

=head1 NAME

Devel::PL_origargv - access to the Perl interpreter's argv

=head1 SYNOPSIS

	my @PL_origargv = Devel::PL_origargv->get;

=head1 DESCRIPTION

If Perl is run with the following command:

	perl -w -Ilib yourscript.pl arg1 arg2

Then C<< @ARGV >> will be pre-populated with C<arg1> and C<arg2>, and C<< $0 >>
will reflect the name of your script, but there's no way to access C<< -w >> or
C<< -Ilib >>.

This module provides one class method that returns Perl's original argv array
as a list.

=over

=item C<< get >>

Returns argv as a list of strings. If called in scalar context, returns argc
(i.e. the count of argv).

=back

=head1 BUGS

Please report any bugs to
L<http://rt.cpan.org/Dist/Display.html?Queue=Devel-PL_origargv>.

=head1 SEE ALSO

L<https://metacpan.org/source/RGARCIA/perl-5.6.2/perl.c#L856>

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2012-2013 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

