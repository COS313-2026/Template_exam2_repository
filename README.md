# COS 313: Exam 2 Workspace Setup (Phase 1)

**Course:** COS 313: Database Systems (Fall 2026, Bethel University)  
**Assessment:** Exam 2: Practical Data Engineering Assessment  
**Environment:** GitHub Codespaces & PostgreSQL  

---

## Welcome to the Exam 2 Environment!

This repository provides your isolated environment for **Exam 2: Practical Data Engineering Assessment**. 

We are using a **two-phase setup** so you do not lose valuable exam time waiting for your cloud container to build:
* **Phase 1 (Now – Pre-Exam Warmup):** Provision and test your Codespaces environment and review the official syntax reference.
* **Phase 2 (Exam Day):** The practical exam questions, database tables, and starter template will be released right before the exam begins.

---

## Pre-Exam Warmup Instructions (Do This in Advance)

### 1. Launch Your Codespace
Open this repository in GitHub Codespaces by clicking the green **Code** button $\rightarrow$ **Codespaces** $\rightarrow$ **Create codespace on main** (or open via the template link provided by your instructor).

> [!NOTE]
> The initial build may take **3 to 5 minutes** as Codespaces downloads the base Ubuntu container, launches PostgreSQL, and configures database extensions. This is normal and is why we do this ahead of time!

### 2. Verify Your Database Connection
Once your Codespace finishes building and the terminal prompt appears, run this quick health-check command to confirm PostgreSQL is running and ready:

```bash
psql -h localhost -c "SELECT 1 AS database_connected;"
```

You should see:
```text
 database_connected 
--------------------
                  1
(1 row)
```

If you see this output, your database environment is **100% verified and operational**!

> [!TIP]
> If you already opened your Codespace before this update, either include `-h localhost` in your `psql` commands or run `source ~/.bashrc` once in your terminal to load the database connection settings.

### 3. Review the Permitted Syntax Reference
Review [`EXAM_2_SYNTAX_REFERENCE.md`](EXAM_2_SYNTAX_REFERENCE.md) in this repository. This 1-page document is official permitted material for the exam and outlines standard PostgreSQL syntax rules for:
* DDL (`CREATE TABLE`, primary/foreign keys, constraints, `DROP TABLE CASCADE`)
* Schema Evolution (`ALTER TABLE ADD/DROP CONSTRAINT`)
* ACID Transactions (`BEGIN`, `COMMIT`, `ROLLBACK`)
* Reporting Views (`CREATE VIEW`, `DROP VIEW`)
* Window Functions (`ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`)
* Physical Indexing & Diagnostics (`CREATE INDEX`, `EXPLAIN ANALYZE`)

---

## What Happens on Exam Day?

1. **10 Minutes Before Exam Time:**  
   Open your Codespace so it is awake and running. (Codespaces automatically sleeps after 30 minutes of inactivity; waking up an existing Codespace takes only ~15 seconds).
2. **At the Start of the Exam:**  
   Your instructor will release the exam payload to this repository. You will run a single command in your terminal to sync the practical test and database files:
   ```bash
   git pull upstream main
   ```
   *(Or `git pull origin main` depending on your Codespace setup).*
3. **Begin the Assessment:**  
   Follow the instructions in the newly pulled exam document, write your solutions in your template file, and submit your work to Moodle when finished.
