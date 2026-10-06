FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim

# Zensical does not support uv's symlink link mode.
# The venv lives outside /docs so the bind mount in compose.yaml does not hide it.
ENV UV_LINK_MODE=copy \
    UV_PROJECT_ENVIRONMENT=/opt/venv \
    PATH="/opt/venv/bin:$PATH"

WORKDIR /docs

# Versions come from uv.lock, same as a local uv sync
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-install-project

EXPOSE 8000

ENTRYPOINT ["zensical"]
# 0.0.0.0 is required, otherwise the server is unreachable from outside the container.
CMD ["serve", "--dev-addr", "0.0.0.0:8000"]
