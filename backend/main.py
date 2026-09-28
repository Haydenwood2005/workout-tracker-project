from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def home():
    return {
        "message": "Gym Tracker API is running!"
    }
