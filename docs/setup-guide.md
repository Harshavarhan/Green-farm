# Developer Setup Guide

## Prerequisites
- Python 3.9+
- Node.js 18+
- Java JDK 17
- Maven 3.8+
- PostgreSQL 14+
- Git

## Initial Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/green-farm.git
cd green-farm
```

### 2. Database Setup
1. Install PostgreSQL
2. Create Database:
```sql
CREATE DATABASE green_farm;
```

3. Create `.env` file in `database` directory:
```env
DB_USER=your_username
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=green_farm
```

### 3. Python Backend Setup

1. Create and activate virtual environment:
```bash
# Windows
setup_backend.bat

# Manual Setup
python -m venv backend/venv
backend\venv\Scripts\activate  # Windows
source backend/venv/bin/activate  # Linux/Mac
```

2. Install dependencies:
```bash
cd backend
pip install -r requirements.txt
```

3. Create `.env` file in `backend` directory:
```env
# FastAPI Settings
API_VERSION=v1
DEBUG=True
SECRET_KEY=your_secret_key

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/green_farm

# JWT Settings
JWT_SECRET_KEY=your_jwt_secret
JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# External APIs
WEATHER_API_KEY=your_weather_api_key
```

### 4. Java Backend Setup

1. Navigate to Java backend:
```bash
cd backend-java
```

2. Create `application.properties` in `src/main/resources`:
```properties
# Server Configuration
server.port=8080
spring.application.name=green-farm-java

# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/green_farm
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update

# JWT Configuration
jwt.secret=your_jwt_secret
jwt.expiration=1800000

# Logging
logging.level.com.farming=DEBUG
```

3. Build the project:
```bash
mvn clean install
```

### 5. Frontend Setup

1. Install dependencies:
```bash
# Windows
setup_frontend.bat

# Manual Setup
cd frontend
npm install
```

2. Create `.env` file in `frontend` directory:
```env
REACT_APP_API_URL=http://localhost:8000/v1
REACT_APP_JAVA_API_URL=http://localhost:8080/api/v1
REACT_APP_WEATHER_API_KEY=your_weather_api_key
```

## Running the Application

### 1. Start Python Backend
```bash
cd backend
uvicorn main:app --reload --port 8000
```

### 2. Start Java Backend
```bash
cd backend-java
mvn spring-boot:run
```

### 3. Start Frontend
```bash
cd frontend
npm start
```

## Development Guidelines

### Code Style
- Python: Follow PEP 8
- Java: Follow Google Java Style Guide
- JavaScript/React: Follow Airbnb Style Guide

### Git Workflow
1. Create feature branch:
```bash
git checkout -b feature/your-feature-name
```

2. Make changes and commit:
```bash
git add .
git commit -m "feat: your feature description"
```

3. Push changes:
```bash
git push origin feature/your-feature-name
```

### Testing

1. Python Backend Tests:
```bash
cd backend
pytest
```

2. Java Backend Tests:
```bash
cd backend-java
mvn test
```

3. Frontend Tests:
```bash
cd frontend
npm test
```

## Troubleshooting

### Common Issues

1. Database Connection Issues
```bash
# Check PostgreSQL service
service postgresql status  # Linux
sc query postgresql       # Windows
```

2. Port Conflicts
```bash
# Windows
netstat -ano | findstr :8000
netstat -ano | findstr :8080
```

3. Virtual Environment Issues
```bash
# Recreate virtual environment
rm -rf backend/venv
python -m venv backend/venv
```

### Getting Help
- Check the issue tracker on GitHub
- Contact the development team
- Review the architecture documentation 