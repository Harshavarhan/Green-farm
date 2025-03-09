-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Farms Table
CREATE TABLE IF NOT EXISTS farms (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    name VARCHAR(100) NOT NULL,
    location_lat DECIMAL(10,8),
    location_long DECIMAL(11,8),
    area_hectares DECIMAL(10,2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Pest Detection History Table
CREATE TABLE IF NOT EXISTS pest_detection_history (
    id SERIAL PRIMARY KEY,
    farm_id INTEGER REFERENCES farms(id),
    pest_name VARCHAR(100) NOT NULL,
    confidence_score DECIMAL(4,3),
    severity VARCHAR(20),
    image_url VARCHAR(255),
    detected_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Weather Data Table
CREATE TABLE IF NOT EXISTS weather_data (
    id SERIAL PRIMARY KEY,
    farm_id INTEGER REFERENCES farms(id),
    temperature DECIMAL(4,1),
    humidity INTEGER,
    wind_speed DECIMAL(5,2),
    rainfall_mm DECIMAL(6,2),
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Soil Moisture Readings Table
CREATE TABLE IF NOT EXISTS soil_moisture_readings (
    id SERIAL PRIMARY KEY,
    farm_id INTEGER REFERENCES farms(id),
    sensor_id VARCHAR(50),
    moisture_level DECIMAL(5,2),
    location_description VARCHAR(100),
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Crop Planning Table
CREATE TABLE IF NOT EXISTS crop_planning (
    id SERIAL PRIMARY KEY,
    farm_id INTEGER REFERENCES farms(id),
    crop_name VARCHAR(100),
    planting_date DATE,
    expected_harvest_date DATE,
    area_hectares DECIMAL(10,2),
    status VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes
CREATE INDEX idx_pest_detection_farm ON pest_detection_history(farm_id);
CREATE INDEX idx_weather_farm ON weather_data(farm_id);
CREATE INDEX idx_soil_moisture_farm ON soil_moisture_readings(farm_id);
CREATE INDEX idx_crop_planning_farm ON crop_planning(farm_id);

-- Create User Roles Enum
CREATE TYPE user_role AS ENUM ('admin', 'farmer', 'viewer');

-- Add role column to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS role user_role DEFAULT 'farmer';