use strict;
use warnings;
use PDL;
use blib;
use Prima qw(Application);
use PDL::Graphics::Prima;
use PDL::NiceSlice;

my $t_series = random(101)->cumusumover;
my $heights = $t_series(1:) - $t_series(:-2);

my $wDisplay = Prima::MainWindow->create(
	text    => 'Spike Test',
	size	=> [500, 500],
);

$wDisplay->insert('Plot',
#	-data => [$t_series, $heights],
	-data => [$t_series(:-2), $heights, plotType => pt::Spikes],
	pack => { fill => 'both', expand => 1},
#	y => {scaling => sc::Log},
);

run Prima;
