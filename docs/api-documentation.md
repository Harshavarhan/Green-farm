# API Documentation

## Python Backend (FastAPI) Endpoints

### Authentication
```http
POST /auth/login
POST /auth/register
GET /auth/profile
PUT /auth/profile
```

### Pest Detection
```http
POST /pest_detection/analyze
- Accepts image file for pest analysis
- Returns detected pests and confidence scores

GET /pest_detection/history
- Returns pest detection history for the user's farm

GET /pest_detection/statistics
- Returns pest detection statistics and trends
```

### Weather
```http
GET /weather/current
- Returns current weather data for farm location

GET /weather/forecast
- Returns 7-day weather forecast

GET /weather/history
- Returns historical weather data
```

### Soil Moisture
```http
GET /soil_moisture/current
- Returns current soil moisture readings

GET /soil_moisture/history
- Returns historical soil moisture data

POST /soil_moisture/threshold
- Set moisture threshold alerts
```

## Java Backend (Spring Boot) Endpoints

### User Management
```http
GET /api/users
POST /api/users
PUT /api/users/{id}
DELETE /api/users/{id}
```

### Farm Management
```http
GET /api/farms
POST /api/farms
PUT /api/farms/{id}
DELETE /api/farms/{id}

GET /api/farms/{id}/reports
POST /api/farms/{id}/sensors
```

### Data Analytics
```http
GET /api/analytics/yield
GET /api/analytics/pest-impact
GET /api/analytics/weather-correlation
```

## Request/Response Examples

### 1. Pest Detection Analysis
```json
// Request (POST /pest_detection/analyze)
{
  "image": "base64_encoded_image",
  "location": {
    "latitude": 12.9716,
    "longitude": 77.5946
  }
}

// Response
{
  "detected_pests": [
    {
      "pest_name": "Fall Armyworm",
      "confidence": 0.95,
      "severity": "high",
      "recommendations": [
        "Apply neem-based pesticide",
        "Increase monitoring frequency"
      ]
    }
  ],
  "timestamp": "2024-03-09T10:30:00Z"
}
```

### 2. Weather Data
```json
// Response (GET /weather/current)
{
  "temperature": 25.6,
  "humidity": 65,
  "wind_speed": 12,
  "rainfall_probability": 30,
  "last_updated": "2024-03-09T10:30:00Z"
}
```

### 3. Soil Moisture
```json
// Response (GET /soil_moisture/current)
{
  "moisture_level": 45,
  "status": "optimal",
  "sensor_readings": [
    {
      "sensor_id": "SM001",
      "value": 45,
      "location": "North Field",
      "timestamp": "2024-03-09T10:30:00Z"
    }
  ]
}
```

## Error Responses
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Detailed error message",
    "details": {
      "field": "Additional error context"
    }
  }
}
```

## Authentication
All endpoints except `/auth/login` and `/auth/register` require JWT authentication.

### JWT Format
```
Authorization: Bearer <token>
```

## Rate Limiting
- 100 requests per minute for authenticated users
- 20 requests per minute for unauthenticated users

## Versioning
API versioning is handled through URL prefixing:
- Python Backend: `/v1/`
- Java Backend: `/api/v1/` 