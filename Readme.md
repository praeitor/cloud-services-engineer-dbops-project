# Проектная работа дисциплины DBOps

### Создаем базу данных
```sql
CREATE DATABASE store;
```

### Создаем пользователя для миграций и тестов и прдоставить нужные права
```sql
CREATE USER <your_user> WITH PASSWORD '<secure password>';
GRANT ALL PRIVILEGES ON DATABASE store TO <your_user>;
GRANT ALL PRIVILEGES ON SCHEMA public TO <your_user>;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO <your_user>;
```

### Делаем аналитический запрос в базу
```sql
SELECT o.date_created, SUM(op.quantity)
FROM orders AS o
    JOIN order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created;
```

### Автор
***Булгаков Денис***
