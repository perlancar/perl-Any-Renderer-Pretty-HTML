package Any::Renderer::Pretty::HTML;
# ABSTRACT: Render data structures through Data::Format::Pretty::HTML

use 5.010;
use strict;
use warnings;

use Data::Format::Pretty::HTML qw(format_pretty);

sub new {
    my ($class, $format, $options) = @_;
    die "Invalid format $format" unless $format eq 'Pretty::HTML';
    bless {options=>$options}, $class;
}

sub render {
    my ($self, $data) = @_;
    use Data::Dump; dd $self;
    format_pretty($data, $self->{options});
}

sub requires_template {
    0;
}

sub available_formats {
    ['Pretty::HTML'];
}

1;
__END__

=head1 SYNOPSIS

 use Any::Renderer;

 my %options = (table_column_orders => [[qw/a b/]]);
 my $format  = "Pretty::HTML";
 my $r = Any::Renderer->new($format, \%options);

 my $data_structure = [...]; # arbitrary structure
 my $string = $r->render($data_structure);


=head1 DESCRIPTION

Any::Renderer::Pretty::HTML renders any Perl data structure passed to it with
L<Data::Format::Pretty::HTML>. For example:

 [{a=>11, b=>12}, {a=>21, c=>23}, {b=>32, c=>33}]

will be rendered into something like:

 <table>
   <tr>
     <th>a</th>
     <td>b</th>
     <th>c</th>
   </tr>
   <tr>
     <td>11</td>
     <td>12</td>
     <td></td>
   </tr>
   <tr>
     <td>21</td>
     <td></td>
     <td>23</td>
   </tr>
   <tr>
     <td></td>
     <td>32</td>
     <td>33</td>
   </tr>
 </table>

See L<Data::Format::Pretty::HTML> for more details on the formatting.


=head1 METHODS

=head2 new($format, \%options)

$format must be "Pretty::HTML". See L</OPTIONS> for valid \%options.

=head2 $r->render($data_structure) => STRING

The main method.


=head2 FUNCTIONS

None is exported.

=head2 requires_template($format) => BOOL

Will return false.

=head2 available_formats() => ARRAYREF

Will return ['Pretty::HTML'].


=head1 OPTIONS

Options are format_pretty() options. See L<Data::Format::Pretty::HTML> for
available options.


=head1 SEE ALSO

L<Data::Format::Pretty::HTML>

=cut
