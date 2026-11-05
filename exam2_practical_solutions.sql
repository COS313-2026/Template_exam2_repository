-- ==============================================================================
-- COURSE:       COS 313: Database Systems (Fall 2026, Bethel University)
-- ASSESSMENT:   Exam 2: Practical Data Engineering Assessment
-- STUDENT NAME: [Your Name Here]
-- STUDENT ID:   [Your Bethel ID Here]
-- DATABASE:     sports_db
-- EXECUTION:    psql -h localhost -U admin -d sports_db -a -f exam2_practical_solutions.sql > exam2_output.txt 2>&1
-- ==============================================================================


-- ------------------------------------------------------------------------------
-- Task 1: (12 Points)
-- ------------------------------------------------------------------------------

-- 1. Idempotent Teardown:




-- 2. Create Parent Table (aircraft):




-- 3. Create Child Table (maintenance_logs):




-- 4. Insert Test Records (Pre-populated for your convenience):
INSERT INTO aircraft (tail_number, model, seating_capacity) VALUES
('N101SW', 'Boeing 737-800', 160),
('N202SW', 'Airbus A320', 150);

INSERT INTO maintenance_logs (aircraft_id, inspection_date, technician_name, status, repair_cost) VALUES
(1, '2026-10-15', 'Sarah Jenkins', 'Passed', 0.00),
(1, '2026-10-20', 'Marcus Vance', 'Failed', 1450.00),
(2, '2026-10-25', 'Sarah Jenkins', 'Passed', 320.50);




-- 5. Verification Queries:




-- ------------------------------------------------------------------------------
-- Task 2: (10 Points)
-- ------------------------------------------------------------------------------

-- 1. Create View (v_flight_manifest_summary):




-- 2. Verification Query 1 (Sample Rows):




-- 3. Verification Query 2 (Row Count):






-- ------------------------------------------------------------------------------
-- Task 3: (10 Points)
-- ------------------------------------------------------------------------------

-- 1. Step 1: Attempt Constraint Addition:




-- 2. Step 2: Audit Dirty Data:




-- 3. Step 3: Transactional Cleansing:




-- 4. Step 4: Apply Constraint:




-- 5. Step 5: Verify Constraint Armor:




-- [TASK 3 REFLECTION]
-- Exact error message produced by PostgreSQL:
-- 




-- ------------------------------------------------------------------------------
-- Task 4: (8 Points)
-- ------------------------------------------------------------------------------

-- 1. Step 1: Baseline Audit:




-- 2. Step 2: Disaster Simulation:




-- 3. Step 3: Disaster Recovery:




-- 4. Step 4: Post-Recovery Audit:





-- ------------------------------------------------------------------------------
-- Task 5:  (15 Points)
-- ------------------------------------------------------------------------------

-- 1. Part A: Create Analytical View (v_vip_tier_rankings):




-- 2. Part A: Verification Query:




-- 3. Part B: Query Bottleneck Diagnosis (EXPLAIN ANALYZE)
EXPLAIN ANALYZE
SELECT p.first_name, p.last_name, p.email, f.flight_number, f.origin_code, f.dest_code, t.seat_number, t.ticket_price
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
WHERE p.email = 'samantha.anderson1@skywings.com';

-- [TASK 5B DIAGNOSTIC REFLECTION]
-- 1. Bottleneck table:
-- 2. Physical scan operator and total rows examined:
-- 3. Why did the database engine choose this access method for this table? (Explain the schema-level cause):
-- 




-- 4. Part C: Performance Remediation (DDL):




-- 5. Part C: Verification (EXPLAIN ANALYZE)
EXPLAIN ANALYZE
SELECT p.first_name, p.last_name, p.email, f.flight_number, f.origin_code, f.dest_code, t.seat_number, t.ticket_price
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
WHERE p.email = 'samantha.anderson1@skywings.com';

-- [TASK 5C PERFORMANCE VERIFICATION]
-- 1. New scan operator on tuned table:
-- 2. Execution Time before index creation:
-- 3. Execution Time after index creation (and approximate speedup factor):
-- 
