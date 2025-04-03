-- Добавим данные в таблицу product
INSERT INTO product (id, name, picture_url, price) VALUES
  (1, 'Сливочная',     'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
  (2, 'Особая',        'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
  (3, 'Молочная',      'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
  (4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00),
  (5, 'Мюнхенская',    'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 339.00),
  (6, 'Русская',       'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

-- Сгенерируем 1 000 000 заказов с случайным статусом и случайной датой за последние 90 дней
INSERT INTO orders (id, status, date_created)
SELECT
  i,
  (ARRAY['pending', 'shipped', 'cancelled'])[FLOOR(random() * 3 + 1)],
  CURRENT_DATE - (random() * 90)::int
FROM generate_series(1, 1000000) AS s(i);

-- Сгенерируем 1 000 000 строк в order_product с количеством от 1 до 50 и случайным продуктом от 1 до 6
INSERT INTO order_product (quantity, order_id, product_id)
SELECT
  FLOOR(1 + random() * 50)::int,
  i,
  1 + FLOOR(random() * 6)::int
FROM generate_series(1, 1000000) AS s(i);
