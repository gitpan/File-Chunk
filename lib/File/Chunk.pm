# ABSTRACT: Highly configurable chunked file reading/writing

package File::Chunk;
{
  $File::Chunk::VERSION = '0.001';
}
BEGIN {
  $File::Chunk::AUTHORITY = 'cpan:DHARDISON';
}
use Moose;
use Bread::Board::Declare;

use namespace::autoclean;


__PACKAGE__->meta->make_immutable;

1;
