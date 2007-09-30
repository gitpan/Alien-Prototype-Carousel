package Alien::Prototype::Carousel;

###############################################################################
# Required inclusions.
###############################################################################
use strict;
use warnings;
use Carp;
use File::Copy qw(copy);
use File::Path qw(mkpath);

###############################################################################
# Version number
###############################################################################
our $CAROUSEL_VERSION = '0.26';
our $VERSION = '0.26.1';

###############################################################################
# Subroutine:   version()
###############################################################################
# Return the Prototype Carousel component version number.
#
# Not to be confused with the 'Alien::Prototype::Carousel' version number
# (which is the version number of the Perl wrapper).
###############################################################################
sub version {
    return $CAROUSEL_VERSION;
}

###############################################################################
# Subroutine:   path()
###############################################################################
# Returns the path to the available copy of the Prototype Carousel component.
###############################################################################
sub path {
    my $base = $INC{'Alien/Prototype/Carousel.pm'};
    $base =~ s{\.pm}{};
    return $base;
}

###############################################################################
# Subroutine:   install($destdir)
# Parameters:   $destdir    - Destination directory.
###############################################################################
# Installs the Prototype Carousel component into the given '$destdir'.  Throws
# a fatal exception on errors.
###############################################################################
sub install {
    my ($class, $destdir) = @_;
    if (!-d $destdir) {
        mkpath( [$destdir] ) || croak "can't create '$destdir'; $!";
    }
    my $path = $class->path();

    # Install files
    my @files = grep { -f $_ } glob "$path/*.*s";
    foreach my $file (@files) {
        copy( $file, $destdir ) || croak "can't copy '$file' to '$destdir'; $!";
    }
}

1;

=head1 NAME

Alien::Prototype::Carousel - installing and finding Prototype Carousel component

=head1 SYNOPSIS

  use Alien::Prototype::Carousel;
  ...
  $version = Alien::Prototype::Carousel->version();
  $path    = Alien::Prototype::Carousel->path();
  ...
  Alien::Prototype::Carousel->install( $my_destination_directory );

=head1 DESCRIPTION

Please see L<Alien> for the manifesto of the Alien namespace.

=head1 METHODS

=over

=item version()

Return the Prototype Carousel component version number. 

Not to be confused with the C<Alien::Prototype::Carousel> version number
(which is the version number of the Perl wrapper). 

=item path()

Returns the path to the available copy of the Prototype Carousel component. 

=item install($destdir)

Installs the Prototype Carousel component into the given C<$destdir>.
Throws a fatal exception on errors. 

=back

=head1 AUTHOR

Graham TerMarsch (cpan@howlingfrog.com)

=head1 LICENSE

Copyright (C) 2007, Graham TerMarsch.  All rights reserved.

This is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO

http://prototype-carousel.xilinus.com/,
L<Alien>.

=cut
