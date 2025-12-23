from fastapi import FastAPI

app = FastAPI(title="hello-api")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/")
def hello():
    return {"message": "Hello, CI/CD World!"}