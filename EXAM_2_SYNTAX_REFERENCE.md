# Exam 2 Official PostgreSQL Syntax Reference

**Course:** COS 313: Database Systems (Bethel University)  
**Permitted Material:** Part 2 Isolated Practical Only  
**Scope:** Formal BNF / PostgreSQL SQL Grammar. *Zero semantic query recipes.*

---

### 1. Data Definition Language (DDL)

```sql
-- Idempotent Table Teardown (Reverse Dependency Order)
DROP TABLE IF EXISTS table_name [CASCADE | RESTRICT];

-- Table Creation (Column-Level & Table-Level Constraints)
CREATE TABLE table_name (
    column_name DATA_TYPE [PRIMARY KEY] [NOT NULL | NULL] [UNIQUE] [DEFAULT default_expr]
        [REFERENCES parent_table(pk_col) [ON DELETE {CASCADE | RESTRICT | SET NULL | NO ACTION}]]
        [CHECK (boolean_expression)],
    ...
    [CONSTRAINT constraint_name] PRIMARY KEY (col1, ...),
    [CONSTRAINT constraint_name] UNIQUE (col1, ...),
    [CONSTRAINT constraint_name] CHECK (boolean_expression),
    [CONSTRAINT constraint_name] FOREIGN KEY (fk_col) REFERENCES parent_table(pk_col)
        [ON DELETE {CASCADE | RESTRICT | SET NULL | NO ACTION}]
        [ON UPDATE {CASCADE | RESTRICT | SET NULL | NO ACTION}]
);
```

**Common PostgreSQL Data Types:**
* Integers: `SERIAL` (auto-incrementing surrogate PK), `INT` / `INTEGER`, `BIGINT`
* Text: `VARCHAR(n)` (variable length with limit), `TEXT` (unlimited length), `CHAR(n)` (fixed length)
* Exact Numerics: `NUMERIC(precision, scale)` / `DECIMAL(p, s)` (e.g., `NUMERIC(8,2)`)
* Date & Time: `DATE` (`'YYYY-MM-DD'`), `TIMESTAMP` (`'YYYY-MM-DD HH:MI:SS'`)
* Boolean: `BOOLEAN` (`TRUE`, `FALSE`)

---

### 2. Schema Evolution (`ALTER TABLE`)

```sql
-- Add or Drop Columns
ALTER TABLE table_name ADD COLUMN column_name DATA_TYPE [NOT NULL | NULL] [DEFAULT default_expr];
ALTER TABLE table_name DROP COLUMN column_name [CASCADE | RESTRICT];

-- Add or Drop Constraints
ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (boolean_expression);
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (col1, ...);
ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (fk_col) 
    REFERENCES parent_table(pk_col) [ON DELETE {CASCADE | RESTRICT | SET NULL}];

ALTER TABLE table_name DROP CONSTRAINT constraint_name;
```

---

### 3. Data Manipulation Language (DML)

```sql
-- Insert Records
INSERT INTO table_name (col1, col2, ...) VALUES (val1, val2, ...);
INSERT INTO table_name (col1, col2, ...) VALUES (val1a, val2a, ...), (val1b, val2b, ...);

-- Update Records
UPDATE table_name 
SET col1 = expr1, col2 = expr2 
WHERE condition;

-- Delete Records
DELETE FROM table_name 
WHERE condition;
```

---

### 4. ACID Transactions

```sql
BEGIN;       -- Open an explicit transaction block (private sandbox)
COMMIT;      -- Persist all modifications permanently to disk
ROLLBACK;    -- Discard and reverse all uncommitted modifications in current transaction block
```

---

### 5. Virtual Tables & Reporting Views

```sql
-- Create or Replace Virtual View
CREATE [OR REPLACE] VIEW view_name AS
SELECT ...;

-- Drop Virtual View
DROP VIEW IF EXISTS view_name [CASCADE | RESTRICT];
```

---

### 6. Standard Query Structure, Joins & Grouping

```sql
SELECT 
    alias1.col1,
    alias2.col2,
    AGG_FUNC(alias1.col3) AS aggregate_alias
FROM table1 alias1
[INNER] JOIN table2 alias2 ON alias1.pk_col = alias2.fk_col
[LEFT [OUTER] JOIN table3 alias3 ON alias1.col = alias3.col]
[WHERE filter_condition]
[GROUP BY alias1.col1, alias2.col2, ...]
[HAVING group_filter_condition]
[ORDER BY sort_col1 [ASC | DESC], sort_col2 [ASC | DESC]]
[LIMIT n];
```

**Essential Scalar & Aggregate Functions:**
* Null Handling: `COALESCE(expr1, expr2, ...)` — returns first non-NULL argument
* Mathematics: `ABS(numeric_expr)`, `ROUND(numeric_expr, decimals)`
* Aggregates: `COUNT(*)`, `COUNT(col)`, `SUM(col)`, `AVG(col)`, `MIN(col)`, `MAX(col)`
* Value Lists: `col IN (val1, val2, ...)`

---

### 7. Window Functions & Analytical Partitioning

```sql
SELECT 
    column_name,
    window_function() OVER (
        [PARTITION BY partition_col1, partition_col2, ...]
        [ORDER BY sort_col1 [ASC | DESC], sort_col2 [ASC | DESC], ...]
    ) AS window_alias
FROM table_name;
```

*Ranking Functions:* `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`.  
*Aggregate Window Functions:* `SUM(col) OVER (...)`, `AVG(col) OVER (...)`, `COUNT(col) OVER (...)`.

---

### 8. Physical B-Tree Indexing & Query Diagnostics

```sql
-- Create B-Tree Index
CREATE [UNIQUE] INDEX index_name ON table_name (col1 [ASC | DESC], ...);

-- Drop Index
DROP INDEX IF EXISTS index_name;

-- Execution Plan Diagnostics
EXPLAIN ANALYZE query_statement;

-- Refresh Background Table Statistics
ANALYZE table_name;
```
