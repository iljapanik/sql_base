INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

-- Основной запрос для получения конвертированных балансов
WITH latest_currency AS (
    SELECT 
        b.updated AS balance_updated,
        b.currency_id,
        b.money,
        b.user_id,
        -- ближайший курс в прошлом
        (SELECT rate_to_usd 
         FROM currency c 
         WHERE c.id = b.currency_id 
         AND c.updated <= b.updated 
         ORDER BY c.updated DESC 
         LIMIT 1) AS past_rate,
        -- ближайший курс в будущем
        (SELECT rate_to_usd 
         FROM currency c 
         WHERE c.id = b.currency_id 
         AND c.updated > b.updated 
         ORDER BY c.updated ASC 
         LIMIT 1) AS future_rate,
        -- название валюты
        (SELECT name 
         FROM currency c 
         WHERE c.id = b.currency_id 
         LIMIT 1) AS currency_name
    FROM balance b
    WHERE EXISTS (SELECT 1 FROM currency WHERE id = b.currency_id) --минус валюты без ключа
)
SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    lc.currency_name AS currency_name,
    (lc.money * COALESCE(lc.past_rate, lc.future_rate)) AS currency_in_usd
FROM latest_currency lc
LEFT JOIN "user" u ON lc.user_id = u.id
ORDER BY name DESC, lastname, currency_name;