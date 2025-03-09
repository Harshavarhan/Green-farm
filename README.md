# Green Farm Project

A comprehensive farming management system with both Python and Java backends, and a React frontend.

## Project Structure
```
📦 Green-farm
├── 📂 frontend/          # React Frontend
├── 📂 backend/           # Python Backend (FastAPI)
├── 📂 backend-java/      # Java Backend (Spring Boot)
├── 📂 database/          # Database Configuration
├── 📂 docs/              # Documentation
└── 📂 scripts/           # Utility Scripts
```

## Setup Instructions

### Backend Setup (Python)
1. Run `setup_backend.bat`
2. The script will:
   - Create a Python virtual environment
   - Install required packages
   - Set up the development environment

### Frontend Setup
1. Run `setup_frontend.bat`
2. The script will:
   - Install all npm dependencies
   - Set up the React development environment

### Java Backend Setup
1. Navigate to `backend-java` directory
2. Run `mvn clean install`
3. Start the Spring Boot application

### Database Setup
1. Install PostgreSQL
2. Create a database named 'green_farm'
3. Update credentials in `.env` file

## Environment Variables
Create `.env` files in both frontend and backend directories with appropriate configurations.

## Running the Application
1. Start Python Backend: `uvicorn main:app --reload`
2. Start Java Backend: `mvn spring-boot:run`
3. Start Frontend: `npm start`

## Documentation
Detailed documentation is available in the `docs` directory.
