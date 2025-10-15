COMMENT ON TABLE PERSON_DISCOUNTS IS 'Table contains information about personal discounts';

COMMENT ON COLUMN PERSON_DISCOUNTS.ID IS 'Unique id, PRIMARY KEY';

COMMENT ON COLUMN PERSON_DISCOUNTS.PERSON_ID IS 'Unique id, FOREIGIN KEY from persons table';

COMMENT ON COLUMN PERSON_DISCOUNTS.PIZZERIA_ID IS 'Unique id, FOREIGIN KEY from pizzeria';

COMMENT ON COLUMN PERSON_DISCOUNTS.DISCOUNT IS 'Discount value in percent (range values from 0 to 100)';