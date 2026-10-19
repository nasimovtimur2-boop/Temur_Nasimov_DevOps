FROM python:3.12-slim
WORKDIR /app
COPY app/ /app/
RUN python -m compileall -q /app && useradd --create-home appuser
USER appuser
EXPOSE 8080
ENV PYTHONUNBUFFERED=1 PORT=8080
CMD ["python", "main.py"]
