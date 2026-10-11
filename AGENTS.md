# Repository Guidance

## Purpose and boundaries
- Maintain a reusable, typed FastAPI service baseline in `src/template_fastapi_service/`.
- Leave project-specific routes, storage, and deployment policy to the cloned repo.

## Development
- Keep HTTP entry points thin and typed; update the rename script and README when template paths change.
- Preserve package and test layout for a renamed service.

## Validation
- Run `uv sync --frozen --group dev`, `uv run ruff check .`, `uv run ruff format --check .`, `uv run mypy`, `uv run pytest`, and `uv run pre-commit run --all-files`.
- Run `docker compose config` for Compose changes and `uv build` for packaging changes.

## Architecture constraints
- Keep runtime settings injectable rather than tied to a particular host or database.
- Avoid template code that assumes one project's API behavior.

## Safety
- Use placeholder configuration only; never add real service credentials or deployment targets.

## Branching strategy

- This repository uses **trunk-based development**. Create short-lived change branches from current `main` and target PRs to `main`.
- Follow the [canonical branching and delivery policy](https://github.com/SpencerRWood/codex-config/blob/main/docs/branching-policy.md), available through the installed codex-config source path. Verify the strategy, release association, fetched base and PR target before implementation and record them in Story evidence. Story completion does not authorize publication or deployment; retain existing review, CI, security and rollback requirements.
- This classification applies to maintenance of the template repository. Replace it with the new repository's classification during project creation; applications must use release-branch integration before Story development begins.
