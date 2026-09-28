from fastapi import FastAPI

app = FastAPI(
    title="Workout Tracker API",
    description="Backend API for the Workout Tracker application",
    version="1.0.0"
)


@app.get("/")
def home():
    return {
        "message": "Workout Tracker API is running!"
    }


@app.get("/health")
def health_check():
    return {
        "status": "healthy"
    }
