/* 
This file is auto generated by pgrx.

The ordering of items is not stable, it is driven by a dependency graph.
*/

-- src/lib.rs:25
-- bootstrap
CREATE TYPE vector;


-- src/postgres/functions.rs:14
-- vectors::postgres::functions::vectors_unload
CREATE  FUNCTION "vectors_unload"(
        "oid" oid /* pgrx_pg_sys::submodules::oids::Oid */
) RETURNS void
STRICT
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vectors_unload_wrapper';

-- src/postgres/functions.rs:5
-- vectors::postgres::functions::vectors_load
CREATE  FUNCTION "vectors_load"(
        "oid" oid /* pgrx_pg_sys::submodules::oids::Oid */
) RETURNS void
STRICT
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vectors_load_wrapper';

-- src/postgres/datatype.rs:424
-- vectors::postgres::datatype::vector_typmod_out
CREATE  FUNCTION "vector_typmod_out"(
        "typmod" INT /* i32 */
) RETURNS cstring /* alloc::ffi::c_str::CString */
IMMUTABLE STRICT PARALLEL SAFE
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vector_typmod_out_wrapper';

-- src/postgres/datatype.rs:411
-- vectors::postgres::datatype::vector_typmod_in
CREATE  FUNCTION "vector_typmod_in"(
        "list" cstring[] /* pgrx::datum::array::Array<&core::ffi::c_str::CStr> */
) RETURNS INT /* i32 */
IMMUTABLE STRICT PARALLEL SAFE
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vector_typmod_in_wrapper';

-- src/postgres/datatype.rs:397
-- vectors::postgres::datatype::vector_out
CREATE  FUNCTION "vector_out"(
        "vector" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS cstring /* alloc::ffi::c_str::CString */
IMMUTABLE STRICT PARALLEL SAFE
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vector_out_wrapper';

-- src/postgres/datatype.rs:349
-- vectors::postgres::datatype::vector_in
CREATE  FUNCTION "vector_in"(
        "input" cstring, /* &core::ffi::c_str::CStr */
        "_oid" oid, /* pgrx_pg_sys::submodules::oids::Oid */
        "typmod" INT /* i32 */
) RETURNS vector /* vectors::postgres::datatype::VectorOutput */
IMMUTABLE STRICT PARALLEL SAFE
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'vector_in_wrapper';

-- src/postgres/casts.rs:17
-- vectors::postgres::casts::cast_vector_to_array
CREATE  FUNCTION "cast_vector_to_array"(
        "vector" vector, /* vectors::postgres::datatype::VectorInput */
        "_typmod" INT, /* i32 */
        "_explicit" bool /* bool */
) RETURNS real[] /* alloc::vec::Vec<vectors::prelude::scalar::Scalar> */
STRICT
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'cast_vector_to_array_wrapper';

-- src/postgres/casts.rs:5
-- vectors::postgres::casts::cast_array_to_vector
CREATE  FUNCTION "cast_array_to_vector"(
        "array" real[], /* pgrx::datum::array::Array<vectors::prelude::scalar::Scalar> */
        "typmod" INT, /* i32 */
        "_explicit" bool /* bool */
) RETURNS vector /* vectors::postgres::datatype::VectorOutput */
STRICT
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'cast_array_to_vector_wrapper';

-- src/embedding/udf.rs:11
-- vectors::embedding::udf::ai_embedding_vector
CREATE  FUNCTION "ai_embedding_vector"(
        "input" TEXT /* alloc::string::String */
) RETURNS vector /* vectors::postgres::datatype::VectorOutput */
STRICT
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'ai_embedding_vector_wrapper';

-- src/postgres/datatype.rs:73
-- creates:
--   Type(vectors::postgres::datatype::Vector)

-- requires:
--   vector_in
--   vector_out
--   vector_typmod_in
--   vector_typmod_out


CREATE TYPE vector (
    INPUT     = vector_in,
    OUTPUT    = vector_out,
    TYPMOD_IN = vector_typmod_in,
    TYPMOD_OUT = vector_typmod_out,
    STORAGE   = EXTENDED,
    INTERNALLENGTH = VARIABLE,
    ALIGNMENT = double
);


-- src/postgres/operators.rs:80
-- vectors::postgres::operators::operator_eq
-- requires:
--   vector
CREATE  FUNCTION "operator_eq"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_eq_wrapper';

-- src/postgres/operators.rs:80
-- vectors::postgres::operators::operator_eq
CREATE OPERATOR = (
        PROCEDURE="operator_eq",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = =,
        NEGATOR = <>,
        RESTRICT = eqsel,
        JOIN = eqjoinsel
);

-- src/postgres/operators.rs:91
-- vectors::postgres::operators::operator_neq
-- requires:
--   vector
CREATE  FUNCTION "operator_neq"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_neq_wrapper';

-- src/postgres/operators.rs:91
-- vectors::postgres::operators::operator_neq
CREATE OPERATOR <> (
        PROCEDURE="operator_neq",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <>,
        NEGATOR = =,
        RESTRICT = eqsel,
        JOIN = eqjoinsel
);

-- src/postgres/operators.rs:8
-- vectors::postgres::operators::operator_add
-- requires:
--   vector
CREATE  FUNCTION "operator_add"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS vector /* vectors::postgres::datatype::VectorOutput */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_add_wrapper';

-- src/postgres/operators.rs:8
-- vectors::postgres::operators::operator_add
CREATE OPERATOR + (
        PROCEDURE="operator_add",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = +
);

-- src/postgres/operators.rs:20
-- vectors::postgres::operators::operator_minus
-- requires:
--   vector
CREATE  FUNCTION "operator_minus"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS vector /* vectors::postgres::datatype::VectorOutput */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_minus_wrapper';

-- src/postgres/operators.rs:20
-- vectors::postgres::operators::operator_minus
CREATE OPERATOR - (
        PROCEDURE="operator_minus",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector /* vectors::postgres::datatype::VectorInput */
);

-- src/postgres/operators.rs:69
-- vectors::postgres::operators::operator_gte
-- requires:
--   vector
CREATE  FUNCTION "operator_gte"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_gte_wrapper';

-- src/postgres/operators.rs:69
-- vectors::postgres::operators::operator_gte
CREATE OPERATOR >= (
        PROCEDURE="operator_gte",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <=,
        NEGATOR = <,
        RESTRICT = scalargtsel,
        JOIN = scalargtjoinsel
);

-- src/postgres/index.rs:34
-- vectors::postgres::index::vectors_amhandler

    CREATE OR REPLACE FUNCTION vectors_amhandler(internal) RETURNS index_am_handler
    PARALLEL SAFE IMMUTABLE STRICT LANGUAGE c AS 'MODULE_PATHNAME', 'vectors_amhandler_wrapper';
    CREATE ACCESS METHOD vectors TYPE INDEX HANDLER vectors_amhandler;
    COMMENT ON ACCESS METHOD vectors IS 'pgvecto.rs index access method';




-- src/postgres/operators.rs:99
-- vectors::postgres::operators::operator_cosine
-- requires:
--   vector
CREATE  FUNCTION "operator_cosine"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS real /* vectors::prelude::scalar::Scalar */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_cosine_wrapper';

-- src/postgres/operators.rs:99
-- vectors::postgres::operators::operator_cosine
CREATE OPERATOR <=> (
        PROCEDURE="operator_cosine",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <=>
);

-- src/postgres/operators.rs:36
-- vectors::postgres::operators::operator_lt
-- requires:
--   vector
CREATE  FUNCTION "operator_lt"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_lt_wrapper';

-- src/postgres/operators.rs:36
-- vectors::postgres::operators::operator_lt
CREATE OPERATOR < (
        PROCEDURE="operator_lt",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = >,
        NEGATOR = >=,
        RESTRICT = scalarltsel,
        JOIN = scalarltjoinsel
);

-- src/postgres/operators.rs:47
-- vectors::postgres::operators::operator_lte
-- requires:
--   vector
CREATE  FUNCTION "operator_lte"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_lte_wrapper';

-- src/postgres/operators.rs:47
-- vectors::postgres::operators::operator_lte
CREATE OPERATOR <= (
        PROCEDURE="operator_lte",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = >=,
        NEGATOR = >,
        RESTRICT = scalarltsel,
        JOIN = scalarltjoinsel
);

-- src/postgres/operators.rs:107
-- vectors::postgres::operators::operator_dot
-- requires:
--   vector
CREATE  FUNCTION "operator_dot"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS real /* vectors::prelude::scalar::Scalar */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_dot_wrapper';

-- src/postgres/operators.rs:107
-- vectors::postgres::operators::operator_dot
CREATE OPERATOR <#> (
        PROCEDURE="operator_dot",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <#>
);

-- src/postgres/operators.rs:58
-- vectors::postgres::operators::operator_gt
-- requires:
--   vector
CREATE  FUNCTION "operator_gt"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS bool /* bool */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_gt_wrapper';

-- src/postgres/operators.rs:58
-- vectors::postgres::operators::operator_gt
CREATE OPERATOR > (
        PROCEDURE="operator_gt",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <,
        NEGATOR = <=,
        RESTRICT = scalargtsel,
        JOIN = scalargtjoinsel
);

-- src/postgres/operators.rs:115
-- vectors::postgres::operators::operator_l2
-- requires:
--   vector
CREATE  FUNCTION "operator_l2"(
        "lhs" vector, /* vectors::postgres::datatype::VectorInput */
        "rhs" vector /* vectors::postgres::datatype::VectorInput */
) RETURNS real /* vectors::prelude::scalar::Scalar */
IMMUTABLE STRICT PARALLEL SAFE 
LANGUAGE c /* Rust */
AS 'MODULE_PATHNAME', 'operator_l2_wrapper';

-- src/postgres/operators.rs:115
-- vectors::postgres::operators::operator_l2
CREATE OPERATOR <-> (
        PROCEDURE="operator_l2",
        LEFTARG=vector, /* vectors::postgres::datatype::VectorInput */
        RIGHTARG=vector, /* vectors::postgres::datatype::VectorInput */
        COMMUTATOR = <->
);

-- src/lib.rs:26
-- finalize
CREATE CAST (real[] AS vector)
        WITH FUNCTION cast_array_to_vector(real[], integer, boolean) AS IMPLICIT;

CREATE CAST (vector AS real[])
        WITH FUNCTION cast_vector_to_array(vector, integer, boolean) AS IMPLICIT;

CREATE OPERATOR CLASS l2_ops
        FOR TYPE vector USING vectors AS
        OPERATOR 1 <-> (vector, vector) FOR ORDER BY float_ops;

CREATE OPERATOR CLASS dot_ops
        FOR TYPE vector USING vectors AS
        OPERATOR 1 <#> (vector, vector) FOR ORDER BY float_ops;

CREATE OPERATOR CLASS cosine_ops
        FOR TYPE vector USING vectors AS
        OPERATOR 1 <=> (vector, vector) FOR ORDER BY float_ops;

