DO $$
DECLARE
    i INT;
    random_date DATE;
    random_account INT;
    random_amount NUMERIC;
    random_category VARCHAR(50);
    random_status VARCHAR(20);
BEGIN
    FOR i IN 1..1500000 LOOP

	    random_date := NOW() - interval '1 day' * (random() * 365)::int;
        random_account := (random() * 1000)::int;
        random_amount := (random() * 10000)::numeric;
        random_category := CASE WHEN random() < 0.5 THEN 'Groceries' ELSE 'Utilities' END;
        random_status := CASE WHEN random() < 0.5 THEN 'Completed' ELSE 'Pending' END;

        INSERT INTO transactions (transaction_date, account_id, amount, category, status)
        VALUES (random_date, random_account, random_amount, random_category, random_status);
 END LOOP;
END $$;
