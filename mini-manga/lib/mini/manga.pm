package mini::manga;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use mini::manga::DB::Schema;
use mini::manga::DB;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();

my $schema = mini::manga::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = mini::manga::DB->new(
            schema       => $schema,
            connect_info => [@$conf],
            # I suggest to enable following lines if you are using mysql.
            # on_connect_do => [
            #     'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
            # ],
        );
    }
    $c->{db};
}

1;
__END__

=head1 NAME

mini::manga - mini::manga

=head1 DESCRIPTION

This is a main context class for mini::manga

=head1 AUTHOR

mini::manga authors.

