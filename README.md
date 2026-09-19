# template-fastapi-service

A minimal, typed FastAPI service template with `uv`, Ruff, mypy, pytest, pre-commit, GitHub Actions, and semantic-release wired together.

## Intended Use

Use this template for small backend HTTP services and internal APIs using FastAPI. The repository infrastructure is ready
for local development and release automation; the package modules are intentionally thin
placeholders for project-specific implementation.

## Project Layout

```text
src/template_fastapi_service/
  __init__.py
  py.typed
  main.py
  api/
    __init__.py
    router.py
    routes/
      __init__.py
      health.py
  models/
    __init__.py
  services/
    __init__.py
  config.py
  exceptions.py
tests/
  unit/
    test_template_integrity.py
  integration/
Dockerfile
docker-compose.yml
```

Keep reusable Python code under `src/template_fastapi_service/` and tests under `tests/`.
The `py.typed` marker declares the package as typed.

## Local Setup

Install dependencies into the local environment:

```sh
uv sync --frozen --group dev
```

Install pre-commit hooks:

```sh
uv run pre-commit install
```

Run all baseline checks locally:

```sh
uv run ruff check .
uv run ruff format --check .
uv run mypy
uv run pytest
uv build
docker compose config
uv run pre-commit run --all-files
```

Use Ruff to apply safe fixes:

```sh
uv run ruff check --fix .
uv run ruff format .
```

## Docker Development

Build and run the API container locally:

```sh
docker compose up --build
```

The API listens on `http://localhost:8000`.

Run backend checks inside the container:

```sh
docker compose run --rm api uv run pytest
docker compose run --rm api uv run ruff check .
docker compose run --rm api uv run mypy
```

The compose file intentionally includes only the API service. Add databases,
caches, workers, or proxies only when a real project needs them.

## Linting, Formatting, And Typing

Ruff and mypy follow the same conventions as the Python library template:
Python 3.14, `src/` layout, strict mypy, 88-character line length, Ruff import
sorting, and normal `assert` statements allowed in tests.

## Tests

The initial tests verify template integrity without pretending application
behavior exists. Add focused unit and integration tests alongside each real
implementation as the copied project grows.

## Build And Release

The package builds with Hatchling through `uv build`. The release workflow
validates mypy, pytest, Docker Compose configuration, and pre-commit before
python-semantic-release runs with conventional commits and tags like `v0.0.1`.
Ruff linting and formatting run through pre-commit.

## Copy And Rename

After copying this template, replace these names everywhere:

- project name: `template-fastapi-service`
- package name: `template_fastapi_service`


Then update package metadata in `pyproject.toml`, refresh `uv.lock` with
`uv lock`, run `uv sync --frozen --group dev`, and run the baseline checks.
