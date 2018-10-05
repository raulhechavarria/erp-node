--
-- PostgreSQL database dump
--

-- Started on 2018-10-04 13:15:28

SET client_encoding = 'WIN1252';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 396 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: rhp
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO rhp;

SET search_path = public, pg_catalog;

--
-- TOC entry 368 (class 1247 OID 16523)
-- Dependencies: 3 1590
-- Name: breakpoint; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE breakpoint AS (
	func oid,
	linenumber integer,
	targetname text
);


ALTER TYPE public.breakpoint OWNER TO rhp;

--
-- TOC entry 370 (class 1247 OID 16526)
-- Dependencies: 3 1591
-- Name: frame; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE frame AS (
	level integer,
	targetname text,
	func oid,
	linenumber integer,
	args text
);


ALTER TYPE public.frame OWNER TO rhp;

--
-- TOC entry 366 (class 0 OID 0)
-- Name: intbig_gkey; Type: SHELL TYPE; Schema: public; Owner: rhp
--

CREATE TYPE intbig_gkey;


--
-- TOC entry 54 (class 1255 OID 16472)
-- Dependencies: 3 366
-- Name: _intbig_in(cstring); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _intbig_in(cstring) RETURNS intbig_gkey
    AS '$libdir/_int', '_intbig_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_in(cstring) OWNER TO rhp;

--
-- TOC entry 55 (class 1255 OID 16473)
-- Dependencies: 3 366
-- Name: _intbig_out(intbig_gkey); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _intbig_out(intbig_gkey) RETURNS cstring
    AS '$libdir/_int', '_intbig_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_out(intbig_gkey) OWNER TO rhp;

--
-- TOC entry 365 (class 1247 OID 16471)
-- Dependencies: 3 55 54
-- Name: intbig_gkey; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE intbig_gkey (
    INTERNALLENGTH = variable,
    INPUT = _intbig_in,
    OUTPUT = _intbig_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.intbig_gkey OWNER TO rhp;

--
-- TOC entry 376 (class 1247 OID 16535)
-- Dependencies: 3 1594
-- Name: proxyinfo; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE proxyinfo AS (
	serverversionstr text,
	serverversionnum integer,
	proxyapiver integer,
	serverprocessid integer
);


ALTER TYPE public.proxyinfo OWNER TO rhp;

--
-- TOC entry 327 (class 0 OID 0)
-- Name: query_int; Type: SHELL TYPE; Schema: public; Owner: rhp
--

CREATE TYPE query_int;


--
-- TOC entry 20 (class 1255 OID 16404)
-- Dependencies: 3 327
-- Name: bqarr_in(cstring); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION bqarr_in(cstring) RETURNS query_int
    AS '$libdir/_int', 'bqarr_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_in(cstring) OWNER TO rhp;

--
-- TOC entry 21 (class 1255 OID 16405)
-- Dependencies: 3 327
-- Name: bqarr_out(query_int); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION bqarr_out(query_int) RETURNS cstring
    AS '$libdir/_int', 'bqarr_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_out(query_int) OWNER TO rhp;

--
-- TOC entry 326 (class 1247 OID 16403)
-- Dependencies: 20 3 21
-- Name: query_int; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE query_int (
    INTERNALLENGTH = variable,
    INPUT = bqarr_in,
    OUTPUT = bqarr_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.query_int OWNER TO rhp;

--
-- TOC entry 372 (class 1247 OID 16529)
-- Dependencies: 3 1592
-- Name: targetinfo; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE targetinfo AS (
	target oid,
	schema oid,
	nargs integer,
	argtypes oidvector,
	targetname name,
	argmodes "char"[],
	argnames text[],
	targetlang oid,
	fqname text,
	returnsset boolean,
	returntype oid
);


ALTER TYPE public.targetinfo OWNER TO rhp;

--
-- TOC entry 374 (class 1247 OID 16532)
-- Dependencies: 3 1593
-- Name: var; Type: TYPE; Schema: public; Owner: rhp
--

CREATE TYPE var AS (
	name text,
	varclass character(1),
	linenumber integer,
	isunique boolean,
	isconst boolean,
	isnotnull boolean,
	dtype oid,
	value text
);


ALTER TYPE public.var OWNER TO rhp;

--
-- TOC entry 26 (class 1255 OID 16413)
-- Dependencies: 3
-- Name: _int_contained(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_contained(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contained(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1895 (class 0 OID 0)
-- Dependencies: 26
-- Name: FUNCTION _int_contained(integer[], integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION _int_contained(integer[], integer[]) IS 'contained in';


--
-- TOC entry 25 (class 1255 OID 16412)
-- Dependencies: 3
-- Name: _int_contains(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_contains(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contains(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1896 (class 0 OID 0)
-- Dependencies: 25
-- Name: FUNCTION _int_contains(integer[], integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION _int_contains(integer[], integer[]) IS 'contains';


--
-- TOC entry 29 (class 1255 OID 16416)
-- Dependencies: 3
-- Name: _int_different(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_different(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_different'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_different(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1897 (class 0 OID 0)
-- Dependencies: 29
-- Name: FUNCTION _int_different(integer[], integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION _int_different(integer[], integer[]) IS 'different';


--
-- TOC entry 31 (class 1255 OID 16418)
-- Dependencies: 3
-- Name: _int_inter(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_inter(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_inter(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 27 (class 1255 OID 16414)
-- Dependencies: 3
-- Name: _int_overlap(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_overlap(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_overlap(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1898 (class 0 OID 0)
-- Dependencies: 27
-- Name: FUNCTION _int_overlap(integer[], integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION _int_overlap(integer[], integer[]) IS 'overlaps';


--
-- TOC entry 28 (class 1255 OID 16415)
-- Dependencies: 3
-- Name: _int_same(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_same(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_same(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1899 (class 0 OID 0)
-- Dependencies: 28
-- Name: FUNCTION _int_same(integer[], integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION _int_same(integer[], integer[]) IS 'same as';


--
-- TOC entry 30 (class 1255 OID 16417)
-- Dependencies: 3
-- Name: _int_union(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION _int_union(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_union(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 23 (class 1255 OID 16408)
-- Dependencies: 326 3
-- Name: boolop(integer[], query_int); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION boolop(integer[], query_int) RETURNS boolean
    AS '$libdir/_int', 'boolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.boolop(integer[], query_int) OWNER TO rhp;

--
-- TOC entry 1900 (class 0 OID 0)
-- Dependencies: 23
-- Name: FUNCTION boolop(integer[], query_int); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION boolop(integer[], query_int) IS 'boolean operation with array';


--
-- TOC entry 48 (class 1255 OID 16449)
-- Dependencies: 3
-- Name: g_int_compress(internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_compress'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_compress(internal) OWNER TO rhp;

--
-- TOC entry 47 (class 1255 OID 16448)
-- Dependencies: 3
-- Name: g_int_consistent(internal, integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_consistent(internal, integer[], integer) RETURNS boolean
    AS '$libdir/_int', 'g_int_consistent'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_consistent(internal, integer[], integer) OWNER TO rhp;

--
-- TOC entry 49 (class 1255 OID 16450)
-- Dependencies: 3
-- Name: g_int_decompress(internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_decompress'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_decompress(internal) OWNER TO rhp;

--
-- TOC entry 50 (class 1255 OID 16451)
-- Dependencies: 3
-- Name: g_int_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_penalty'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.g_int_penalty(internal, internal, internal) OWNER TO rhp;

--
-- TOC entry 51 (class 1255 OID 16452)
-- Dependencies: 3
-- Name: g_int_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_picksplit'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_picksplit(internal, internal) OWNER TO rhp;

--
-- TOC entry 53 (class 1255 OID 16454)
-- Dependencies: 3
-- Name: g_int_same(integer[], integer[], internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_same(integer[], integer[], internal) RETURNS internal
    AS '$libdir/_int', 'g_int_same'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_same(integer[], integer[], internal) OWNER TO rhp;

--
-- TOC entry 52 (class 1255 OID 16453)
-- Dependencies: 3
-- Name: g_int_union(internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_int_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_int_union'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_int_union(internal, internal) OWNER TO rhp;

--
-- TOC entry 57 (class 1255 OID 16476)
-- Dependencies: 3
-- Name: g_intbig_compress(internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_compress'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_compress(internal) OWNER TO rhp;

--
-- TOC entry 56 (class 1255 OID 16475)
-- Dependencies: 3
-- Name: g_intbig_consistent(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_consistent(internal, internal, integer) RETURNS boolean
    AS '$libdir/_int', 'g_intbig_consistent'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_consistent(internal, internal, integer) OWNER TO rhp;

--
-- TOC entry 58 (class 1255 OID 16477)
-- Dependencies: 3
-- Name: g_intbig_decompress(internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_decompress'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_decompress(internal) OWNER TO rhp;

--
-- TOC entry 59 (class 1255 OID 16478)
-- Dependencies: 3
-- Name: g_intbig_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_penalty'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.g_intbig_penalty(internal, internal, internal) OWNER TO rhp;

--
-- TOC entry 60 (class 1255 OID 16479)
-- Dependencies: 3
-- Name: g_intbig_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_picksplit'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_picksplit(internal, internal) OWNER TO rhp;

--
-- TOC entry 62 (class 1255 OID 16481)
-- Dependencies: 3
-- Name: g_intbig_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_same(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_same'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_same(internal, internal, internal) OWNER TO rhp;

--
-- TOC entry 61 (class 1255 OID 16480)
-- Dependencies: 3
-- Name: g_intbig_union(internal, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION g_intbig_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_intbig_union'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.g_intbig_union(internal, internal) OWNER TO rhp;

--
-- TOC entry 64 (class 1255 OID 16499)
-- Dependencies: 3
-- Name: ginint4_consistent(internal, smallint, internal); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ginint4_consistent(internal, smallint, internal) RETURNS internal
    AS '$libdir/_int', 'ginint4_consistent'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.ginint4_consistent(internal, smallint, internal) OWNER TO rhp;

--
-- TOC entry 63 (class 1255 OID 16498)
-- Dependencies: 3
-- Name: ginint4_queryextract(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ginint4_queryextract(internal, internal, smallint) RETURNS internal
    AS '$libdir/_int', 'ginint4_queryextract'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.ginint4_queryextract(internal, internal, smallint) OWNER TO rhp;

--
-- TOC entry 33 (class 1255 OID 16425)
-- Dependencies: 3
-- Name: icount(integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION icount(integer[]) RETURNS integer
    AS '$libdir/_int', 'icount'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.icount(integer[]) OWNER TO rhp;

--
-- TOC entry 39 (class 1255 OID 16432)
-- Dependencies: 3
-- Name: idx(integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION idx(integer[], integer) RETURNS integer
    AS '$libdir/_int', 'idx'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.idx(integer[], integer) OWNER TO rhp;

--
-- TOC entry 65 (class 1255 OID 16513)
-- Dependencies: 3
-- Name: insert_username(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION insert_username() RETURNS trigger
    AS '$libdir/insert_username', 'insert_username'
    LANGUAGE c;


ALTER FUNCTION public.insert_username() OWNER TO rhp;

--
-- TOC entry 44 (class 1255 OID 16440)
-- Dependencies: 3
-- Name: intarray_del_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intarray_del_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_del_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_del_elem(integer[], integer) OWNER TO rhp;

--
-- TOC entry 43 (class 1255 OID 16438)
-- Dependencies: 3
-- Name: intarray_push_array(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intarray_push_array(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_array'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_array(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 42 (class 1255 OID 16436)
-- Dependencies: 3
-- Name: intarray_push_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intarray_push_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_elem(integer[], integer) OWNER TO rhp;

--
-- TOC entry 32 (class 1255 OID 16424)
-- Dependencies: 3
-- Name: intset(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intset(integer) RETURNS integer[]
    AS '$libdir/_int', 'intset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset(integer) OWNER TO rhp;

--
-- TOC entry 46 (class 1255 OID 16445)
-- Dependencies: 3
-- Name: intset_subtract(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intset_subtract(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intset_subtract'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_subtract(integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 45 (class 1255 OID 16442)
-- Dependencies: 3
-- Name: intset_union_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION intset_union_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intset_union_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_union_elem(integer[], integer) OWNER TO rhp;

--
-- TOC entry 74 (class 1255 OID 16537)
-- Dependencies: 3
-- Name: pldbg_abort_target(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_abort_target(session integer) RETURNS SETOF boolean
    AS '$libdir/pldbgapi', 'pldbg_abort_target'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_abort_target(session integer) OWNER TO rhp;

--
-- TOC entry 75 (class 1255 OID 16538)
-- Dependencies: 3
-- Name: pldbg_attach_to_port(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_attach_to_port(portnumber integer) RETURNS integer
    AS '$libdir/pldbgapi', 'pldbg_attach_to_port'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_attach_to_port(portnumber integer) OWNER TO rhp;

--
-- TOC entry 76 (class 1255 OID 16539)
-- Dependencies: 3 368
-- Name: pldbg_continue(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_continue(session integer) RETURNS breakpoint
    AS '$libdir/pldbgapi', 'pldbg_continue'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_continue(session integer) OWNER TO rhp;

--
-- TOC entry 77 (class 1255 OID 16540)
-- Dependencies: 3
-- Name: pldbg_create_listener(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_create_listener() RETURNS integer
    AS '$libdir/pldbgapi', 'pldbg_create_listener'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_create_listener() OWNER TO rhp;

--
-- TOC entry 78 (class 1255 OID 16541)
-- Dependencies: 3
-- Name: pldbg_deposit_value(integer, text, integer, text); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_deposit_value(session integer, varname text, linenumber integer, value text) RETURNS boolean
    AS '$libdir/pldbgapi', 'pldbg_deposit_value'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_deposit_value(session integer, varname text, linenumber integer, value text) OWNER TO rhp;

--
-- TOC entry 79 (class 1255 OID 16542)
-- Dependencies: 3
-- Name: pldbg_drop_breakpoint(integer, oid, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_drop_breakpoint(session integer, func oid, linenumber integer) RETURNS boolean
    AS '$libdir/pldbgapi', 'pldbg_drop_breakpoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_drop_breakpoint(session integer, func oid, linenumber integer) OWNER TO rhp;

--
-- TOC entry 80 (class 1255 OID 16543)
-- Dependencies: 368 3
-- Name: pldbg_get_breakpoints(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_breakpoints(session integer) RETURNS SETOF breakpoint
    AS '$libdir/pldbgapi', 'pldbg_get_breakpoints'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_breakpoints(session integer) OWNER TO rhp;

--
-- TOC entry 83 (class 1255 OID 16546)
-- Dependencies: 376 3
-- Name: pldbg_get_proxy_info(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_proxy_info() RETURNS proxyinfo
    AS '$libdir/pldbgapi', 'pldbg_get_proxy_info'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_proxy_info() OWNER TO rhp;

--
-- TOC entry 81 (class 1255 OID 16544)
-- Dependencies: 3
-- Name: pldbg_get_source(integer, oid); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_source(session integer, func oid) RETURNS text
    AS '$libdir/pldbgapi', 'pldbg_get_source'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_source(session integer, func oid) OWNER TO rhp;

--
-- TOC entry 82 (class 1255 OID 16545)
-- Dependencies: 370 3
-- Name: pldbg_get_stack(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_stack(session integer) RETURNS SETOF frame
    AS '$libdir/pldbgapi', 'pldbg_get_stack'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_stack(session integer) OWNER TO rhp;

--
-- TOC entry 92 (class 1255 OID 16555)
-- Dependencies: 3 372
-- Name: pldbg_get_target_info(text, "char"); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_target_info(signature text, targettype "char") RETURNS targetinfo
    AS '$libdir/targetinfo', 'pldbg_get_target_info'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_target_info(signature text, targettype "char") OWNER TO rhp;

--
-- TOC entry 84 (class 1255 OID 16547)
-- Dependencies: 374 3
-- Name: pldbg_get_variables(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_get_variables(session integer) RETURNS SETOF var
    AS '$libdir/pldbgapi', 'pldbg_get_variables'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_get_variables(session integer) OWNER TO rhp;

--
-- TOC entry 85 (class 1255 OID 16548)
-- Dependencies: 368 3
-- Name: pldbg_select_frame(integer, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_select_frame(session integer, frame integer) RETURNS breakpoint
    AS '$libdir/pldbgapi', 'pldbg_select_frame'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_select_frame(session integer, frame integer) OWNER TO rhp;

--
-- TOC entry 86 (class 1255 OID 16549)
-- Dependencies: 3
-- Name: pldbg_set_breakpoint(integer, oid, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_set_breakpoint(session integer, func oid, linenumber integer) RETURNS boolean
    AS '$libdir/pldbgapi', 'pldbg_set_breakpoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_set_breakpoint(session integer, func oid, linenumber integer) OWNER TO rhp;

--
-- TOC entry 87 (class 1255 OID 16550)
-- Dependencies: 3
-- Name: pldbg_set_global_breakpoint(integer, oid, integer, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_set_global_breakpoint(session integer, func oid, linenumber integer, targetpid integer) RETURNS boolean
    AS '$libdir/pldbgapi', 'pldbg_set_global_breakpoint'
    LANGUAGE c;


ALTER FUNCTION public.pldbg_set_global_breakpoint(session integer, func oid, linenumber integer, targetpid integer) OWNER TO rhp;

--
-- TOC entry 88 (class 1255 OID 16551)
-- Dependencies: 3 368
-- Name: pldbg_step_into(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_step_into(session integer) RETURNS breakpoint
    AS '$libdir/pldbgapi', 'pldbg_step_into'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_step_into(session integer) OWNER TO rhp;

--
-- TOC entry 89 (class 1255 OID 16552)
-- Dependencies: 368 3
-- Name: pldbg_step_over(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_step_over(session integer) RETURNS breakpoint
    AS '$libdir/pldbgapi', 'pldbg_step_over'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_step_over(session integer) OWNER TO rhp;

--
-- TOC entry 90 (class 1255 OID 16553)
-- Dependencies: 368 3
-- Name: pldbg_wait_for_breakpoint(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_wait_for_breakpoint(session integer) RETURNS breakpoint
    AS '$libdir/pldbgapi', 'pldbg_wait_for_breakpoint'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_wait_for_breakpoint(session integer) OWNER TO rhp;

--
-- TOC entry 91 (class 1255 OID 16554)
-- Dependencies: 3
-- Name: pldbg_wait_for_target(integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION pldbg_wait_for_target(session integer) RETURNS integer
    AS '$libdir/pldbgapi', 'pldbg_wait_for_target'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pldbg_wait_for_target(session integer) OWNER TO rhp;

--
-- TOC entry 73 (class 1255 OID 16536)
-- Dependencies: 3
-- Name: plpgsql_oid_debug(oid); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION plpgsql_oid_debug(functionoid oid) RETURNS integer
    AS '$libdir/plugins/plugin_debugger', 'plpgsql_oid_debug'
    LANGUAGE c STRICT;


ALTER FUNCTION public.plpgsql_oid_debug(functionoid oid) OWNER TO rhp;

--
-- TOC entry 22 (class 1255 OID 16407)
-- Dependencies: 326 3
-- Name: querytree(query_int); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION querytree(query_int) RETURNS text
    AS '$libdir/_int', 'querytree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.querytree(query_int) OWNER TO rhp;

--
-- TOC entry 24 (class 1255 OID 16409)
-- Dependencies: 326 3
-- Name: rboolop(query_int, integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION rboolop(query_int, integer[]) RETURNS boolean
    AS '$libdir/_int', 'rboolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rboolop(query_int, integer[]) OWNER TO rhp;

--
-- TOC entry 1901 (class 0 OID 0)
-- Dependencies: 24
-- Name: FUNCTION rboolop(query_int, integer[]); Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON FUNCTION rboolop(query_int, integer[]) IS 'boolean operation with array';


--
-- TOC entry 34 (class 1255 OID 16427)
-- Dependencies: 3
-- Name: sort(integer[], text); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION sort(integer[], text) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[], text) OWNER TO rhp;

--
-- TOC entry 35 (class 1255 OID 16428)
-- Dependencies: 3
-- Name: sort(integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION sort(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[]) OWNER TO rhp;

--
-- TOC entry 36 (class 1255 OID 16429)
-- Dependencies: 3
-- Name: sort_asc(integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION sort_asc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_asc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_asc(integer[]) OWNER TO rhp;

--
-- TOC entry 37 (class 1255 OID 16430)
-- Dependencies: 3
-- Name: sort_desc(integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION sort_desc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_desc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_desc(integer[]) OWNER TO rhp;

--
-- TOC entry 68 (class 1255 OID 16516)
-- Dependencies: 3
-- Name: ssl_client_cert_present(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_client_cert_present() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_client_cert_present'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_cert_present() OWNER TO rhp;

--
-- TOC entry 71 (class 1255 OID 16519)
-- Dependencies: 3
-- Name: ssl_client_dn(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_client_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn() OWNER TO rhp;

--
-- TOC entry 69 (class 1255 OID 16517)
-- Dependencies: 3
-- Name: ssl_client_dn_field(text); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_client_dn_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn_field(text) OWNER TO rhp;

--
-- TOC entry 66 (class 1255 OID 16514)
-- Dependencies: 3
-- Name: ssl_client_serial(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_client_serial() RETURNS numeric
    AS '$libdir/sslinfo', 'ssl_client_serial'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_serial() OWNER TO rhp;

--
-- TOC entry 67 (class 1255 OID 16515)
-- Dependencies: 3
-- Name: ssl_is_used(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_is_used() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_is_used'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_is_used() OWNER TO rhp;

--
-- TOC entry 72 (class 1255 OID 16520)
-- Dependencies: 3
-- Name: ssl_issuer_dn(); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_issuer_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_dn() OWNER TO rhp;

--
-- TOC entry 70 (class 1255 OID 16518)
-- Dependencies: 3
-- Name: ssl_issuer_field(text); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION ssl_issuer_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_field(text) OWNER TO rhp;

--
-- TOC entry 40 (class 1255 OID 16434)
-- Dependencies: 3
-- Name: subarray(integer[], integer, integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION subarray(integer[], integer, integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer, integer) OWNER TO rhp;

--
-- TOC entry 41 (class 1255 OID 16435)
-- Dependencies: 3
-- Name: subarray(integer[], integer); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION subarray(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer) OWNER TO rhp;

--
-- TOC entry 38 (class 1255 OID 16431)
-- Dependencies: 3
-- Name: uniq(integer[]); Type: FUNCTION; Schema: public; Owner: rhp
--

CREATE FUNCTION uniq(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'uniq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.uniq(integer[]) OWNER TO rhp;

--
-- TOC entry 1106 (class 2617 OID 16426)
-- Dependencies: 33 3
-- Name: #; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR # (
    PROCEDURE = icount,
    RIGHTARG = integer[]
);


ALTER OPERATOR public.# (NONE, integer[]) OWNER TO rhp;

--
-- TOC entry 1107 (class 2617 OID 16433)
-- Dependencies: 39 3
-- Name: #; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR # (
    PROCEDURE = idx,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.# (integer[], integer) OWNER TO rhp;

--
-- TOC entry 1114 (class 2617 OID 16447)
-- Dependencies: 3 31
-- Name: &; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR & (
    PROCEDURE = _int_inter,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &
);


ALTER OPERATOR public.& (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1101 (class 2617 OID 16419)
-- Dependencies: 3 27
-- Name: &&; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR && (
    PROCEDURE = _int_overlap,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1108 (class 2617 OID 16437)
-- Dependencies: 3 42
-- Name: +; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.+ (integer[], integer) OWNER TO rhp;

--
-- TOC entry 1109 (class 2617 OID 16439)
-- Dependencies: 43 3
-- Name: +; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_array,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = +
);


ALTER OPERATOR public.+ (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1110 (class 2617 OID 16441)
-- Dependencies: 3 44
-- Name: -; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR - (
    PROCEDURE = intarray_del_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.- (integer[], integer) OWNER TO rhp;

--
-- TOC entry 1113 (class 2617 OID 16446)
-- Dependencies: 46 3
-- Name: -; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR - (
    PROCEDURE = intset_subtract,
    LEFTARG = integer[],
    RIGHTARG = integer[]
);


ALTER OPERATOR public.- (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1103 (class 2617 OID 16420)
-- Dependencies: 26 3
-- Name: <@; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR <@ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1104 (class 2617 OID 16423)
-- Dependencies: 3 25
-- Name: @; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR @ (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1102 (class 2617 OID 16421)
-- Dependencies: 3 25
-- Name: @>; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR @> (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1099 (class 2617 OID 16411)
-- Dependencies: 326 3 23
-- Name: @@; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR @@ (
    PROCEDURE = boolop,
    LEFTARG = integer[],
    RIGHTARG = query_int,
    COMMUTATOR = ~~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (integer[], query_int) OWNER TO rhp;

--
-- TOC entry 1111 (class 2617 OID 16443)
-- Dependencies: 45 3
-- Name: |; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR | (
    PROCEDURE = intset_union_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.| (integer[], integer) OWNER TO rhp;

--
-- TOC entry 1112 (class 2617 OID 16444)
-- Dependencies: 30 3
-- Name: |; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR | (
    PROCEDURE = _int_union,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = |
);


ALTER OPERATOR public.| (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1105 (class 2617 OID 16422)
-- Dependencies: 3 26
-- Name: ~; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR ~ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (integer[], integer[]) OWNER TO rhp;

--
-- TOC entry 1100 (class 2617 OID 16410)
-- Dependencies: 326 24 3
-- Name: ~~; Type: OPERATOR; Schema: public; Owner: rhp
--

CREATE OPERATOR ~~ (
    PROCEDURE = rboolop,
    LEFTARG = query_int,
    RIGHTARG = integer[],
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~~ (query_int, integer[]) OWNER TO rhp;

--
-- TOC entry 1229 (class 2616 OID 16501)
-- Dependencies: 1339 3
-- Name: gin__int_ops; Type: OPERATOR CLASS; Schema: public; Owner: rhp
--

CREATE OPERATOR CLASS gin__int_ops
    FOR TYPE integer[] USING gin AS
    STORAGE integer ,
    OPERATOR 3 &&(integer[],integer[]) ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) ,
    OPERATOR 8 <@(integer[],integer[]) RECHECK ,
    OPERATOR 13 @(integer[],integer[]) ,
    OPERATOR 14 ~(integer[],integer[]) RECHECK ,
    OPERATOR 20 @@(integer[],query_int) ,
    FUNCTION 1 btint4cmp(integer,integer) ,
    FUNCTION 2 ginarrayextract(anyarray,internal) ,
    FUNCTION 3 ginint4_queryextract(internal,internal,smallint) ,
    FUNCTION 4 ginint4_consistent(internal,smallint,internal);


ALTER OPERATOR CLASS public.gin__int_ops USING gin OWNER TO rhp;

--
-- TOC entry 1227 (class 2616 OID 16456)
-- Dependencies: 1337 3
-- Name: gist__int_ops; Type: OPERATOR CLASS; Schema: public; Owner: rhp
--

CREATE OPERATOR CLASS gist__int_ops
    DEFAULT FOR TYPE integer[] USING gist AS
    OPERATOR 3 &&(integer[],integer[]) ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) ,
    OPERATOR 8 <@(integer[],integer[]) ,
    OPERATOR 13 @(integer[],integer[]) ,
    OPERATOR 14 ~(integer[],integer[]) ,
    OPERATOR 20 @@(integer[],query_int) ,
    FUNCTION 1 g_int_consistent(internal,integer[],integer) ,
    FUNCTION 2 g_int_union(internal,internal) ,
    FUNCTION 3 g_int_compress(internal) ,
    FUNCTION 4 g_int_decompress(internal) ,
    FUNCTION 5 g_int_penalty(internal,internal,internal) ,
    FUNCTION 6 g_int_picksplit(internal,internal) ,
    FUNCTION 7 g_int_same(integer[],integer[],internal);


ALTER OPERATOR CLASS public.gist__int_ops USING gist OWNER TO rhp;

--
-- TOC entry 1228 (class 2616 OID 16483)
-- Dependencies: 365 3 1338
-- Name: gist__intbig_ops; Type: OPERATOR CLASS; Schema: public; Owner: rhp
--

CREATE OPERATOR CLASS gist__intbig_ops
    FOR TYPE integer[] USING gist AS
    STORAGE intbig_gkey ,
    OPERATOR 3 &&(integer[],integer[]) RECHECK ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) RECHECK ,
    OPERATOR 8 <@(integer[],integer[]) RECHECK ,
    OPERATOR 13 @(integer[],integer[]) RECHECK ,
    OPERATOR 14 ~(integer[],integer[]) RECHECK ,
    OPERATOR 20 @@(integer[],query_int) RECHECK ,
    FUNCTION 1 g_intbig_consistent(internal,internal,integer) ,
    FUNCTION 2 g_intbig_union(internal,internal) ,
    FUNCTION 3 g_intbig_compress(internal) ,
    FUNCTION 4 g_intbig_decompress(internal) ,
    FUNCTION 5 g_intbig_penalty(internal,internal,internal) ,
    FUNCTION 6 g_intbig_picksplit(internal,internal) ,
    FUNCTION 7 g_intbig_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist__intbig_ops USING gist OWNER TO rhp;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1600 (class 1259 OID 381288)
-- Dependencies: 3
-- Name: customer; Type: TABLE; Schema: public; Owner: rhp; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    email character varying,
    streetandnumber character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    country character varying
);


ALTER TABLE public.customer OWNER TO rhp;

--
-- TOC entry 1902 (class 0 OID 0)
-- Dependencies: 1600
-- Name: COLUMN customer.phone; Type: COMMENT; Schema: public; Owner: rhp
--

COMMENT ON COLUMN customer.phone IS 'unique';


--
-- TOC entry 1599 (class 1259 OID 381286)
-- Dependencies: 3 1600
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: rhp
--

CREATE SEQUENCE customer_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO rhp;

--
-- TOC entry 1903 (class 0 OID 0)
-- Dependencies: 1599
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhp
--

ALTER SEQUENCE customer_id_seq OWNED BY customer.id;


--
-- TOC entry 1904 (class 0 OID 0)
-- Dependencies: 1599
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhp
--

SELECT pg_catalog.setval('customer_id_seq', 34, true);


--
-- TOC entry 1602 (class 1259 OID 381304)
-- Dependencies: 3
-- Name: orders; Type: TABLE; Schema: public; Owner: rhp; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    numberorder character varying NOT NULL,
    date date,
    idcustomer integer,
    paymenttype character varying
);


ALTER TABLE public.orders OWNER TO rhp;

--
-- TOC entry 1601 (class 1259 OID 381302)
-- Dependencies: 1602 3
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: rhp
--

CREATE SEQUENCE orders_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO rhp;

--
-- TOC entry 1905 (class 0 OID 0)
-- Dependencies: 1601
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhp
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- TOC entry 1906 (class 0 OID 0)
-- Dependencies: 1601
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhp
--

SELECT pg_catalog.setval('orders_id_seq', 64, true);


--
-- TOC entry 1603 (class 1259 OID 381400)
-- Dependencies: 3
-- Name: ordersproduct; Type: TABLE; Schema: public; Owner: rhp; Tablespace: 
--

CREATE TABLE ordersproduct (
    idproduct integer,
    idorders integer
);


ALTER TABLE public.ordersproduct OWNER TO rhp;

--
-- TOC entry 1596 (class 1259 OID 381266)
-- Dependencies: 3
-- Name: product; Type: TABLE; Schema: public; Owner: rhp; Tablespace: 
--

CREATE TABLE product (
    id integer NOT NULL,
    name text NOT NULL,
    weight real,
    price real,
    description character varying
);


ALTER TABLE public.product OWNER TO rhp;

--
-- TOC entry 1595 (class 1259 OID 381264)
-- Dependencies: 3 1596
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: rhp
--

CREATE SEQUENCE product_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO rhp;

--
-- TOC entry 1907 (class 0 OID 0)
-- Dependencies: 1595
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhp
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- TOC entry 1908 (class 0 OID 0)
-- Dependencies: 1595
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhp
--

SELECT pg_catalog.setval('product_id_seq', 15, true);


--
-- TOC entry 1598 (class 1259 OID 381277)
-- Dependencies: 3
-- Name: shippingaddress; Type: TABLE; Schema: public; Owner: rhp; Tablespace: 
--

CREATE TABLE shippingaddress (
    id integer NOT NULL,
    streetandnumber character varying NOT NULL,
    city character varying,
    state character varying,
    zipcode character varying,
    country character varying
);


ALTER TABLE public.shippingaddress OWNER TO rhp;

--
-- TOC entry 1597 (class 1259 OID 381275)
-- Dependencies: 1598 3
-- Name: shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: rhp
--

CREATE SEQUENCE shippingaddress_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shippingaddress_id_seq OWNER TO rhp;

--
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1597
-- Name: shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhp
--

ALTER SEQUENCE shippingaddress_id_seq OWNED BY shippingaddress.id;


--
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1597
-- Name: shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhp
--

SELECT pg_catalog.setval('shippingaddress_id_seq', 25, true);


--
-- TOC entry 1872 (class 2604 OID 381291)
-- Dependencies: 1600 1599 1600
-- Name: id; Type: DEFAULT; Schema: public; Owner: rhp
--

ALTER TABLE customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 381307)
-- Dependencies: 1602 1601 1602
-- Name: id; Type: DEFAULT; Schema: public; Owner: rhp
--

ALTER TABLE orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- TOC entry 1870 (class 2604 OID 381269)
-- Dependencies: 1595 1596 1596
-- Name: id; Type: DEFAULT; Schema: public; Owner: rhp
--

ALTER TABLE product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 381280)
-- Dependencies: 1597 1598 1598
-- Name: id; Type: DEFAULT; Schema: public; Owner: rhp
--

ALTER TABLE shippingaddress ALTER COLUMN id SET DEFAULT nextval('shippingaddress_id_seq'::regclass);


--
-- TOC entry 1887 (class 0 OID 381288)
-- Dependencies: 1600
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: rhp
--

INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (30, 'sebatian m', '3052649636', 'sebastina@sdfd.com', '7950 NW 53rd Street Suite 300', 'Miami,', 'FL', ' 33166', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (4, 'juan', '53622969', 'raul.hechavarria@yahhoo.com', '', '', '', '', '');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (25, 'gianni', '7863087054', 'GIANNIESTEVEZ81@GMAIL.COM', '1', 'h', 'sd', '123', '123');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (29, 'RAUL H', '7862239429', 'raulhperez@gmail.com', '196 E 41ST ST', 'HIALEAH', 'FL', '33013', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (32, 'Dairys M', '305 3459807', 'daurys@gmail.com', 'bayside', 'miami', 'FL', '33013', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (28, 'Antony Ho', '3052649636', 'dairys@gmail.com', 'palmetto and 64', 'hialea', 'fl', '33012', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (33, 'jesus', '7862239429', 'raulhperez@gmail.com', '15311 Vantage  Parkway West Suite 104', 'houston', 'tx', '32313', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (34, 'Danabel', '7863087054', 'GIANNIESTEVEZ81@GMAIL.COM', '8261 nw 5 terra, 336', 'miami', 'Florida', '33126', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (27, 'Jose Perez', '7862239429', 'raulhperez@gmail.com', '196 E 41ST ST', 'HIALEAH', 'FL', '33013', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (3, 'jhon  willia', '3056984598', 'williz@gmail.comwilli', '160 w 64 terr', 'miami', 'fl', '23546', 'usa');


--
-- TOC entry 1888 (class 0 OID 381304)
-- Dependencies: 1602
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: rhp
--

INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (52, '23432234', '2018-10-09', 32, '23');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (53, '23', '2018-10-16', 27, '2');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (54, '34534', '2018-10-09', 27, '2');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (55, '435', '2018-10-16', 33, '2343');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (56, '565-dfg', '2018-10-01', 27, '23');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (57, '45324-234', '2018-10-08', 33, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (58, '234-srewrwe', '2018-10-15', 33, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (59, '2343', '2018-10-15', 33, 'Other');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (60, '4565234', '2018-10-16', 28, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (61, '312321-234', '2018-10-15', 3, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (62, '213235', '2018-10-15', 29, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (63, '3', '2018-10-29', 29, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (64, '1111111111111', '2018-10-08', 32, 'Credit Card');


--
-- TOC entry 1889 (class 0 OID 381400)
-- Dependencies: 1603
-- Data for Name: ordersproduct; Type: TABLE DATA; Schema: public; Owner: rhp
--

INSERT INTO ordersproduct (idproduct, idorders) VALUES (12, 52);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 52);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (11, 53);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (2, 53);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (11, 54);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (2, 54);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (12, 55);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (7, 55);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (12, 56);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 56);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (2, 57);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 57);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (2, 58);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 58);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (12, 59);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (7, 59);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 60);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (7, 61);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 62);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (4, 63);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (12, 64);
INSERT INTO ordersproduct (idproduct, idorders) VALUES (7, 64);


--
-- TOC entry 1885 (class 0 OID 381266)
-- Dependencies: 1596
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: rhp
--

INSERT INTO product (id, name, weight, price, description) VALUES (11, 'hard disk', 2.4000001, 54.990002, 'computer part');
INSERT INTO product (id, name, weight, price, description) VALUES (12, 'pendrive', 12.4, 10.99, 'refresh apartment');
INSERT INTO product (id, name, weight, price, description) VALUES (2, 'iphone', 0.23, 1000, 'cell phone');
INSERT INTO product (id, name, weight, price, description) VALUES (4, 'pendrive', 12.4, 10.99, 'save informacion');
INSERT INTO product (id, name, weight, price, description) VALUES (7, 'laptop lenovo', 23.34, 56.34, 'production');


--
-- TOC entry 1886 (class 0 OID 381277)
-- Dependencies: 1598
-- Data for Name: shippingaddress; Type: TABLE DATA; Schema: public; Owner: rhp
--

INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (4, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (5, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (6, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (7, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (9, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (10, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (11, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (12, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (13, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'usa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (8, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (14, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (15, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (16, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (17, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (18, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (19, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (20, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'ussssssssssssa');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (21, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'nuevitas');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (22, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'nuevitas');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (23, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'nuevitas');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (24, '196 east 41 street', 'Hialeah', 'Fl', '33013', 'nuevitas');
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country) VALUES (25, '160 West 64 terr', 'Hialeah', 'Fl', '33012', 'United State');


--
-- TOC entry 1879 (class 2606 OID 381296)
-- Dependencies: 1600 1600
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: rhp; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 1881 (class 2606 OID 381312)
-- Dependencies: 1602 1602
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: rhp; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 1875 (class 2606 OID 381274)
-- Dependencies: 1596 1596
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: rhp; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 1877 (class 2606 OID 381285)
-- Dependencies: 1598 1598
-- Name: shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: rhp; Tablespace: 
--

ALTER TABLE ONLY shippingaddress
    ADD CONSTRAINT shippingaddress_pkey PRIMARY KEY (id);


--
-- TOC entry 1882 (class 2606 OID 381313)
-- Dependencies: 1602 1878 1600
-- Name: orders_idcustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhp
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_idcustomer_fkey FOREIGN KEY (idcustomer) REFERENCES customer(id);


--
-- TOC entry 1884 (class 2606 OID 381408)
-- Dependencies: 1602 1880 1603
-- Name: ordersproduct_idorders_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhp
--

ALTER TABLE ONLY ordersproduct
    ADD CONSTRAINT ordersproduct_idorders_fkey FOREIGN KEY (idorders) REFERENCES orders(id);


--
-- TOC entry 1883 (class 2606 OID 381403)
-- Dependencies: 1596 1874 1603
-- Name: ordersproduct_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhp
--

ALTER TABLE ONLY ordersproduct
    ADD CONSTRAINT ordersproduct_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(id);


--
-- TOC entry 1894 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: rhp
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM rhp;
GRANT ALL ON SCHEMA public TO rhp;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-10-04 13:15:28

--
-- PostgreSQL database dump complete
--

