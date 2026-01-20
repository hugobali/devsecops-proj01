FROM python:3.12-alpine

WORKDIR /app

#RUN useradd -m appuser

# Crear usuario no root en Alpine
RUN addgroup -S appuser && adduser -S appuser -G appuser

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app app

# Ajustar permisos
RUN chown -R appuser:appuser /app

USER appuser

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
