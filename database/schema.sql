-- Create the database
CREATE DATABASE gym_tracker;

USE gym_tracker;



-- 1. USERS

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2. EXERCISES

CREATE TABLE exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    muscle_group VARCHAR(50),
    equipment VARCHAR(50)
);


-- 3. WORKOUTS

CREATE TABLE workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    started_at DATETIME NOT NULL,
    completed_at DATETIME,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);


-- 4. WORKOUT EXERCISES

CREATE TABLE workout_exercises (
    workout_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_id INT NOT NULL,
    exercise_id INT NOT NULL,
    exercise_order INT NOT NULL,

    FOREIGN KEY (workout_id)
        REFERENCES workouts(workout_id)
        ON DELETE CASCADE,

    FOREIGN KEY (exercise_id)
        REFERENCES exercises(exercise_id)
);


-- 5. SETS

CREATE TABLE sets (
    set_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_exercise_id INT NOT NULL,
    set_number INT NOT NULL,
    weight DECIMAL(6,2),
    reps INT NOT NULL,

    FOREIGN KEY (workout_exercise_id)
        REFERENCES workout_exercises(workout_exercise_id)
        ON DELETE CASCADE
);


-- Insert data

-- 1. EXERCISES

INSERT INTO exercises (name, muscle_group, equipment)
VALUES
    ('Barbell Bench Press', 'Chest', 'Barbell'),
    ('Incline Barbell Bench Press', 'Chest', 'Barbell'),
    ('Dumbbell Bench Press', 'Chest', 'Dumbbell'),
    ('Incline Dumbbell Press', 'Chest', 'Dumbbell'),
    ('Cable Fly', 'Chest', 'Cable'),

    ('Barbell Squat', 'Legs', 'Barbell'),
    ('Leg Press', 'Legs', 'Machine'),
    ('Leg Extension', 'Legs', 'Machine'),
    ('Leg Curl', 'Legs', 'Machine'),
    ('Romanian Deadlift', 'Legs', 'Barbell'),

    ('Deadlift', 'Back', 'Barbell'),
    ('Barbell Row', 'Back', 'Barbell'),
    ('Lat Pulldown', 'Back', 'Cable'),
    ('Seated Cable Row', 'Back', 'Cable'),
    ('Pull Up', 'Back', 'Pull-up Bar'),

    ('Barbell Bicep Curl', 'Biceps', 'Barbell'),
    ('Dumbbell Bicep Curl', 'Biceps', 'Dumbbell'),
    ('Hammer Curl', 'Biceps', 'Dumbbell'),

    ('Tricep Pushdown', 'Triceps', 'Cable'),
    ('Skull Crusher', 'Triceps', 'Barbell'),
    ('Overhead Tricep Extension', 'Triceps', 'Dumbbell'),

    ('Dumbbell Shoulder Press', 'Shoulders', 'Dumbbell'),
    ('Barbell Shoulder Press', 'Shoulders', 'Barbell'),
    ('Dumbbell Lateral Raise', 'Shoulders', 'Dumbbell'),
    ('Face Pull', 'Shoulders', 'Cable');
    
