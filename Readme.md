# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"


## Создание пользователя PostgreSQL для автотестов и миграций

Были выполнены следующие SQL-запросы:

```sql
CREATE USER dbops_user WITH PASSWORD 'secure_password';
GRANT CONNECT ON DATABASE store TO dbops_user;
GRANT USAGE ON SCHEMA public TO dbops_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dbops_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO dbops_user;
GRANT CREATE, TEMP ON DATABASE store TO dbops_user;
GRANT ALL ON SCHEMA public TO dbops_user;
