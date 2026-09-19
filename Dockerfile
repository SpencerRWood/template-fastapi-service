FROM python:3.14-slim

ENV UV_PROJECT_ENVIRONMENT=/opt/template-fastapi-service-venv
ENV PATH="/opt/template-fastapi-service-venv/bin:${PATH}"

WORKDIR /app

COPY pyproject.toml uv.lock .python-version ./
COPY src ./src
COPY tests ./tests

RUN pip install --no-cache-dir uv \
    && uv sync --frozen --group dev

CMD ["uv", "run", "uvicorn", "template_fastapi_service.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
