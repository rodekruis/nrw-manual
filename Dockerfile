FROM squidfunk/mkdocs-material:9

# glightbox is not in the base image, and the pinned versions come from here
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# The base image's entrypoint is mkdocs, so these are its arguments.
# 0.0.0.0 is required, otherwise the server is unreachable from outside the container.
CMD ["serve", "--config-file", "config/en/mkdocs.yml", "--dev-addr", "0.0.0.0:8000"]
