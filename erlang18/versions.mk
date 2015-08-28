# $NetBSD: Makefile.versions,v 1.17 2013/10/20 18:37:49 asau Exp $
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

ERLANG_VERSION=			18.0.3
DIST_VERSION_MAJOR=		18.0.3
#DIST_VERSION_MINOR=		1

_VERSIONS=				\
	asn1			4.0	\
	common_test		1.11	\
	compiler		6.0	\
	cosEvent		2.2	\
	cosEventDomain		1.2	\
	cosFileTransfer		1.2	\
	cosNotification		1.2	\
	cosProperty		1.2	\
	cosTime			1.2	\
	cosTransactions		1.3	\
	crypto			3.6	\
	debugger		4.1	\
	dialyzer		2.8	\
	diameter		1.10	\
	edoc			0.7.17	\
	eldap			1.2	\
	erl_docgen		0.4	\
	erl_interface		3.8	\
	erts			7.0.3	\
	et			1.5.1	\
	eunit			2.2.10	\
	gs			1.6	\
	hipe			3.12	\
	ic			4.4	\
	inets			6.0	\
	jinterface		1.6	\
	kernel			4.0	\
	megaco			3.18	\
	mnesia			4.13	\
	observer		2.1	\
	odbc			2.11	\
	orber			3.8	\
	os_mon			2.4	\
	ose			1.1	\
	otp_mibs		1.1	\
	parsetools		2.1	\
	percept			0.8.11	\
	public_key		1.0	\
	reltool			0.7	\
	runtime_tools		1.9.1	\
	sasl			2.5	\
	snmp			5.2	\
	ssh			4.0	\
	ssl			7.0	\
	stdlib			2.5	\
	syntax_tools		1.7	\
	test_server		3.9	\
	tools			2.8	\
	typer			0.9.9	\
	webtool			0.9	\
	wx			1.4	\
	xmerl			1.3.8

PLIST_SUBST+=	VERSION=${DIST_VERSION_MAJOR}

.for name version in ${_VERSIONS}
VERSION.${name}=${version}
PLIST_SUBST+=	VERSION.${name}=${version}
.endfor

# Generate PLIST
.for _pkg_ _version_ in $(_VERSIONS)
PRINT_PLIST_AWK+=	{if ($$0 ~ /\/$(_pkg_)-$(_version_)\//) {sub(/\/$(_pkg_)-$(_version_)\//,"/$(_pkg_)-$${VERSION.$(_pkg_)}/", $$0);}}
# documentation:
PRINT_PLIST_AWK+=	{gsub(/\/$(_pkg_)-$(_version_)\.pdf/,"/$(_pkg_)-$${VERSION.$(_pkg_)}.pdf", $$0);}
.endfor
PRINT_PLIST_AWK+=	{if ($$0 ~ /\/releases\/${DIST_VERSION_MAJOR}\//) {sub(/\/releases\/${DIST_VERSION_MAJOR}\//,"/releases/$${VERSION}/", $$0);}}
# documentation:
PRINT_PLIST_AWK+=	{gsub(/\/otp-system-documentation-$(VERSION.erts)\.pdf/,"/otp-system-documentation-$${VERSION.erts}.pdf", $$0);}
