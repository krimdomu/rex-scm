package Rex::SCM;

use strict;
use warnings;

require Exporter;
use base qw(Exporter);
use vars qw(@EXPORT %REPOS);
@EXPORT = qw(repository checkout);

sub repository {
   my ($name, %data) = @_;
   $REPOS{$name} = \%data;
}

sub checkout {
   my ($name, %data) = @_;

   my $type = $REPOS{"$name"}->{"type"};
   my $class = "Rex::SCM::\u$type";
   eval "use $class;";
   if($@) {
      Rex::Logger::info("Error loading SCM: $@\n");
      exit 1;
   }

   my $scm = $class->new;
   $scm->checkout($REPOS{$name}, $name, \%data);
}

1;
