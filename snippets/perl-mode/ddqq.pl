# -*- mode: snippet -*-
# name: Data::Dumper qq
# key: dd
# --
use Data::Dumper;
$Data::Dumper::Useqq = 1;
{
	no warnings 'redefine';
	sub Data::Dumper::qquote { return qq("$_[0]"); };
}