# ABSTRACT: Chunk files stored in $X.chunk where $X is an eight "digit" hex number.

package File::Chunk::Format::Hex;
{
  $File::Chunk::Format::Hex::VERSION = '0.002';
}
BEGIN {
  $File::Chunk::Format::Hex::AUTHORITY = 'cpan:DHARDISON';
}
use Moose;
use namespace::autoclean;

use MooseX::Params::Validate;
use MooseX::Types::Path::Class 'Dir';

use Path::Class::Rule;

with 'File::Chunk::Format';

sub find_chunk_files {
    my $self = shift;
    my ($dir) = pos_validated_list( \@_, { isa => Dir, coerce => 1 } );

    my $rules = Path::Class::Rule->new->skip_vcs->file->name(qr/^[[:xdigit:]]{8}\.chunk$/);

    return $rules->iter( $dir, { depthfirst => 1 } );
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

File::Chunk::Format::Hex - Chunk files stored in $X.chunk where $X is an eight "digit" hex number.

=head1 VERSION

version 0.002

=head1 AUTHOR

Dylan William Hardison <dylan@hardison.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Infinity Interactive, Inc.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
