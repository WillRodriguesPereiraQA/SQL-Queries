# SQL Queries

This repository collects SQL queries and solutions for database exercises and real-world scenarios. Each entry documents a problem, the relevant schema or context, and the SQL statement used to resolve it.

## Local environment (Docker)

A lightweight MySQL 8 setup lets you run the exercises from the terminal without installing MySQL on Windows.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) for Windows

### First-time setup

```powershell
# From the repository root
copy .env.example .env
docker compose up -d
```

Wait until the container is healthy:

```powershell
docker compose ps
```

The database `exercises` is created automatically with the schema and seed data from the [Access Control](Access%20Control) exercise.

### Run queries from the terminal

**Interactive shell:**

```powershell
docker compose exec mysql mysql -uroot -proot exercises
```

**Run a single query:**

```powershell
docker compose exec -T mysql mysql -uroot -proot exercises -e "SELECT * FROM user_define;"
```

**Run a SQL file:**

```powershell
.\scripts\run-sql.ps1 sql\verify-taylor-permissions.sql
```

**Helper script (interactive or with mysql flags):**

```powershell
.\scripts\mysql.ps1
.\scripts\mysql.ps1 -e "SHOW TABLES;"
```

### Access Control workflow

1. Check Taylor's current permissions:

```powershell
.\scripts\run-sql.ps1 sql\verify-taylor-permissions.sql
```

2. Apply the solution from [Access Control](Access%20Control):

```powershell
docker compose exec -T mysql mysql -uroot -proot exercises -e "INSERT INTO role_action_rela (id, role_id, action_id) VALUES (7, 3, 5);"
```

3. Verify again — Taylor should now have `modify products`.

### Stop and clean up

```powershell
# Stop the container (keeps data for next time)
docker compose down

# Stop and delete all data (fresh start on next up)
docker compose down -v
```

After `down -v`, the init scripts run again the next time you start the container.

### Connection details

| Setting  | Default value |
|----------|---------------|
| Host     | `localhost`   |
| Port     | `3306`        |
| Database | `exercises`   |
| User     | `dev`         |
| Password | `dev`         |
| Root password | `root`   |

You can override these in `.env` (copy from `.env.example`).

## Queries

| File | Description |
|------|-------------|
| [Access Control](Access%20Control) | Fix RBAC permissions for an employee who can create products but cannot modify them. The goal is to grant view and modify access without changing company inventory. |

1. Consultas Básicas e Filtros

SELECT * FROM TABELA;

SELECT * FROM TABELA WHERE status = 'ativo';

SELECT * FROM TABELA WHERE data_criação >= '2026-01-01' AND valor > 100;

SELECT * FROM USUARIOS WHERE email LIKE '%@GMAIL.COM';

2. Funções de Agregação e Somas

SELECT SUM(Valor_Total) FROM TABELA WHERE id_cliente = 5;

3. Comandos de Escrita e Modificação (DML)

INSERT INTO tabela (colunas...) VALUES ('valor1'...)

UPDATE tabela SET WHERE condiçãoDELETE FROM WHERE LIKE

GROUBY
AND OR IN LIKE IS NULL IS NNOT NULL

ORDER BY
LIMIT
INNER JOIN juntar 2 tabelas
LEFT JOI juntar 2 tableas traz dados da primeira table

INSERT INTO

UPDATE
SET
WHERE