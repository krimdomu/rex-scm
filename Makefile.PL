use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'Rex::SCM',
   VERSION_FROM => 'lib/Rex/SCM.pm',
   PREREQ_PM => {'Rex' => '0.2.0'},
   LICENSE => 'perl'
);

