#!/usr/bin/perl

### codechart.pl :: THIS SCRIPT CREATES UNICODE CODECHARTS FOR FONTS 
## I, ALEKSANDR ANDREEV, HEREBY RELEASE THIS CODE INTO THE PUBLIC DOMAIN
## PERMISSION IS HEREBY GRANTED TO USE, MODIFY AND DISTRIBUTE THIS SCRIPT WITHOUT LIMITATIONS
## UNLESS OTHERWISE PROHIBITED BY LAW

use strict;
use utf8;
use charnames ();
use Tie::IxHash;
use File::Basename;

sub min ($$) { $_[$_[0] > $_[1]] };
sub max ($$) { $_[$_[0] < $_[1]] };

tie my %ranges, "Tie::IxHash";

%ranges = (
	"Basic Latin" => [(0x000 .. 0x007F)],
	"Latin-1 Supplement" => [(0x0080 .. 0x00FF)],
	"Cyrillic" => [(0x0400 .. 0x04FF)],
	"Cyrillic Supplement" => [(0x0500 .. 0x052F)],
	"Cyrillic Extended A" => [(0x2DE0 .. 0x2DFF)],
	"Cyrillic Extended B" => [(0xA640 .. 0xA69F)],
	"Cyrillic Extended C" => [(0x1C80 .. 0x1C8F)],
	"Greek" => [(0x0370 .. 0x03FF)],
	"Greek Extended" => [(0x1F00 .. 0x1FFF)],
	"Glagolitic" => [(0x2C00 .. 0x2C5F)],
	"Glagolitic Extended" => [(0x1E000 .. 0x1E02F)],
	"Georgian" => [(0x10A0 .. 0x10FF)],
	"General Punctuation" => [(0x2000 .. 0x206F)],
	"Miscellaneous Symbols" => [(0x2600 .. 0x26FF)],
	"Supplemental Punctuation" => [(0x2E00 ..  0x2E4F)],
	"Combining Diacritical Marks" => [(0x0300 .. 0x036F)],
	"Combining Diacritical Marks Supplement" => [(0x1DC0 .. 0x1DFF)],
	"Combining Half Marks" => [(0xFE20 .. 0xFE2F)],	
	"Byzantine Musical Symbols" => [(0x1D000 .. 0x1D015)],
	"Miscellaneous Symbols and Pictographs" => [(0x1F310 .. 0x1F41F)],
	"Miscellaneous Symbols and Pictographs con't" => [(0x1F510 .. 0x1F54F)],
	"`Open Range' Private Use" => [(0xF400 .. 0xF4FF)],
	"`Open Range' Private Use (con't)" => [(0xF500 .. 0xF5FF)],
);

my %combiners = (
	0xA674  => "Wide Est",
	0xA675  => "Eight I",
	0xA676  => "Ten I",
	0xA677  => "Combining U",
	0xA67B  => "Omega",
	0xA678  => "Hard Sign",
	0xA67A  => "Soft Sign",
	0xA679  => "Yeru",
	0xA69E  => "Ef",
	0xA69F  => "Iotified E",
	0xFE2E  => "Titlo Left",
	0xFE2F  => "Titlo Right"
	); # listing of characters that Unicode::Collate doesn't recognize

my ($fontname, $path, $suffix) = fileparse ($ARGV[0], qr/\.[^.]*/);
my $output = $path . "/" . $fontname . ".tex";
unless ($fontname && -e $ARGV[0]) {
	print "Usage: codechart.pl /path/to/my/font.ttf\n\n";
	exit;
}

my $phrase = index($fontname, "Fedorovsk") != -1 ? "Хрⷭ҇то́съ вᲂскре́се и҆з ме́ртвыхъ , сме́ртїю сме́рть пᲂпра́въ , и҆ сꙋ́щымъ во грᲂбѣ́хъ живо́тъ дарᲂва́въ ." : "Хрⷭ҇то́съ воскре́се и҆з̾ ме́ртвыхъ, сме́ртїю сме́рть попра́въ, и҆ сꙋ́щымъ во гробѣ́хъ живо́тъ дарова́въ.";

use Font::TTF;
use Font::TTF::Font;
use Font::TTF::Glyph;

my $f = Font::TTF::Font->open ($ARGV[0]);

# force a read of all the tables
$f->tables_do( sub { $_[0]->read; } );

## this array keeps track of all combining marks that we will need to TEST!
my @marx = ();

open (OUTFILE, "> $output") || die "Cannot write to file $output: $!";
print OUTFILE "\\documentclass{article}
\\usepackage{fontspec}
\\usepackage{xcolor}
\\usepackage{tabu}
\\usepackage{hyperref}
\\usepackage{polyglossia}
\\usepackage[top=0.5in, bottom=0.5in, left=0.5in, right=0.5in]{geometry}
\\newfontfamily\\glyphfont[Path=./]{$fontname.otf}
\\setmainfont[Mapping=tex-text]{Linux Libertine O}
\\setdefaultlanguage{english}
\\setotherlanguage{russian} % don't have Church Slavic available yet :(

\\begin{document}
\\tabulinesep=1.2mm
";
### SOME FONT INFORMATION
#my $copyright = index($fontname, "Fedorovsk") != -1 ? "Copyright 2013 Aleksandr Andreev and Nikita Simmons.

#This font is part of the Ponomar Project Slavonic Computing Initiative. See http://www.ponomar.net/ for more information.

#Original glyph design by Nikita Simmons. Reencoding for Unicode, OpenType and Graphite feature creation and some tweaking by Aleksandr Andreev.

#This font is BETA-STAGE SOFTWARE and is intended primarily for software evaluation purposes." : $f->{'name'}{'strings'}[0][1][0]{0};
my $copyright = $f->{'name'}{'strings'}[0][1][0]{0};
my $name = $f->{'name'}{'strings'}[1][1][0]{0};
my $version = $f->{'name'}{'strings'}[5][1][0]{0};
my $author = $f->{'name'}{'strings'}[9][1][0]{0};

print OUTFILE "\\section{Font Documentation} \n\n  ";
print OUTFILE "\\textbf{Font name}: $name \\\\\n";
print OUTFILE "\\textbf{Font author}: $author \\\\\n";
print OUTFILE "\\textbf{Version}: $version \\\\\n";
print OUTFILE "\\textbf{Copyright information}: $copyright \\\\\n";

print OUTFILE qq(
\\section{Font Test} 

{\\glyphfont{\\tiny The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
{\\glyphfont{\\scriptsize The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
{\\glyphfont{\\small The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
{\\glyphfont{The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
{\\glyphfont{\\large The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
{\\glyphfont{\\huge The quick brown fox jumps over the lazy dog. 1234567890}} \\\\
\\begin{russian}
{\\glyphfont{\\tiny $phrase }} \\\\
{\\glyphfont{\\scriptsize $phrase}} \\\\
{\\glyphfont{\\small $phrase}} \\\\
{\\glyphfont{ $phrase}} \\\\
{\\glyphfont{\\large $phrase}} \\\\
{\\glyphfont{\\huge $phrase}} \\\\
\\end{russian}
);

print OUTFILE "\\clearpage";

foreach my $range (keys %ranges) {
	# DOES FONT HAVE ANY GLYPHS IN THIS RANGE?
	my $HAS_GLYPHS = 0;
	foreach (@{ $ranges{$range} }) {
		$HAS_GLYPHS += defined $f->{'cmap'}{'Tables'}[1]{'val'}{$_};
	}
	next unless $HAS_GLYPHS;
	
	print OUTFILE "\\section{$range}\n\n";

	my $numcols = int ( scalar (@{ $ranges{$range} }) / 16) - 1; # number of columns
	my $tablestart = ${ $ranges{$range} }[0];
	my $tablestop = $tablestart + $numcols * 16 + 15;
	my $width = max(1.05 * ($numcols + 1), 4.0); 
	
	print OUTFILE "\\begin{tabu} to " . ($width) . "cm {X[r]|";
	for (my $j = 0; $j < $numcols + 1; $j++) {
		print OUTFILE "X[c,b]|";
	}
	print OUTFILE "}\n\n";

	my @colheaders = ();
	for (my $i = $tablestart; $i < $tablestart + 16 * ($numcols + 1); $i += 16) {
		push (@colheaders, $i);
	}
	print OUTFILE "  & " . join ( " & ", map { "\\tiny{" . substr(sprintf("Ux%04x", $_), 0, -1) . "}" } @colheaders ); 
	print OUTFILE "\\\\\n\n";
	for (my $rowidx = $tablestart; $rowidx < $tablestart + 16; $rowidx++) {
		my @line1 = ();
		my @line2 = ();
		
		for (my $colidx = $rowidx; $colidx < $rowidx + 16 * ($numcols + 1); $colidx += 16) {
			my $value = sprintf("%04x", $colidx);
			my $char  = "\\char\"" . uc(sprintf('%04x', $colidx));  # chr($colidx);
			my $name  = charnames::viacode ($colidx);
			# die join (" ", sort { $a <=> $b } keys %{ $f->{'cmap'}{'Tables'}[1]{'val'} });
		 	if (defined $f->{'cmap'}{'Tables'}[1]{'val'}{$colidx}) {
				if (index($name, "COMBINING") != -1 || exists $combiners{$colidx}) {
					push (@line1, "\\vspace{1mm}\\glyphfont{\\Large{" . chr(0x25CC) . "$char}}");
					push (@marx, $char) unless (index($name, "SIGN") != -1);
				} else {
					push (@line1, "\\vspace{1mm}\\glyphfont{\\Large{$char}}");
				}
			} else {
				push (@line1, "\\vspace{1mm}\\glyphfont{\\Large{\\ }}");
			}
			
			push (@line2, "\\tiny{$value}");
		} # column
		
		my $i = sprintf('%x', $rowidx - $tablestart);
		print OUTFILE "\\hline " . uc($i) . "  & " . join (" & ", @line1) . "\\\\\n";
		print OUTFILE " & " . join (" & ", @line2) . "\\\\\n";
	} #row
	
	print OUTFILE "\\hline\\end{tabu}";
	print OUTFILE "\n\n";	
} # range


print OUTFILE "\n\n";	

if (-e "$path/$fontname-specific-info.tex") {
	print OUTFILE "\\input{$fontname-specific-info.tex}\n";
}

print OUTFILE "\\end{document}"; # XXX
close (OUTFILE);
$f->release;
