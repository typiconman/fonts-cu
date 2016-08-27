#
# spec file for package fonts-cu
#
# Copyright (c) 2016 Aleksandr Andreev. Slavonic Computing Initiative.
# 
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owner, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#
# Please submit bugfixes or comments via http://sci.ponomar.net/

# Definitions
%define fontname fonts-cu

Name:		fonts-cu
Summary:	Unicode Fonts for Church Slavic (Church Slavonic)
License:	OFL-1.1
Group:		System/X11/Fonts
BuildArch:	noarch
Version:	1.0
Release:	0
Source:	%{fontname}-%{version}.tar.bz2
Provides:       scalable-font-cu
Provides:       scalable-font-ru
Provides:       locale(cu;ru)
# Some systems don't like cu locale, so we call it ru
BuildRequires:  fontpackages-devel 
BuildRequires:  unzip # only if zipped
%reconfigure_fonts_prereq
URL:		http://sci.ponomar.net/

%description
This package provides Unicode fonts for the Church Slavonic
(Church Slavic) language, both Cyrillic and Glagolitic alphabets.

Designer: Slavonic Computing Initiative

%prep
%setup -n %{fontname}-%{version}
# Usually empty, but insert fixes here, if necessary

# Zipped fonts require unzip and prepare like this:
%setup -cT
%{uncompress:%{S:0}}

%build
# Usually nothing to do

%install
install -d '%{buildroot}%{_ttfontsdir}
install '-t%{buildroot}%{_ttfontsdir}' -m 644 *.ttf 
install -d '%{buildroot}%{_otfontsdir}
install '-t%{buildroot}%{_otfontsdir}' -m 644 *.otf

# call fonts-config after installation or deinstallation of this package
%reconfigure_fonts_scriptlets

%files
%defattr(-, root, root)
# Include additional content for the font package, if available
# %doc METADATA FONTLOG.txt OFL.txt
%{_ttfontsdir}

%changelog
