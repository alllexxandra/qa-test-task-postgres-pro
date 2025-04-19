# qa-test-task-postgres-pro
Тестовое задание на позицию QA стажера в Postgres Pro.

## Задание 1
Детальный план тестирования описан в файле [testing_strategy.md](/testing_strategy.md)
## Задание 2
- Скрипт создания таблиц [create_tables.sql](/create_tables.sql)
- Скрипт добавления данных [insert_values.sql](/insert_values.sql)
- Скрипт хранимых процедур [stored_procedures.sql](/stored_procedures.sql)
- Скрипт запросов и вызовов процедур [queries.sql](/queries.sql)

### Команды Docker:
-	Создание connection:  docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5431:5432 -d postgres
(порт 5431)
