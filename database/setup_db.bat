@'
@echo off
echo Setting up Green Farm Database...

REM Load environment variables from .env file if it exists
if exist .env (
    for /F "tokens=*" %%A in (.env) do set %%A
)

REM Set default values if not set in .env
if "%DB_USER%"=="" set DB_USER=postgres
if "%DB_PASSWORD%"=="" set DB_PASSWORD=Harsha@7780
if "%DB_HOST%"=="" set DB_HOST=localhost
if "%DB_PORT%"=="" set DB_PORT=5432
if "%DB_NAME%"=="" set DB_NAME=green_farm

REM Create database
echo Creating database...
psql -U %DB_USER% -h %DB_HOST% -p %DB_PORT% -c "CREATE DATABASE %DB_NAME%;"

REM Run initialization script
echo Initializing database schema...
psql -U %DB_USER% -h %DB_HOST% -p %DB_PORT% -d %DB_NAME% -f init.sql

echo Database setup completed!
pause
'@ | Out-File -Encoding ASCII -Force "C:\Users\harsh\Desktop\Green-farm\database\setup_db.bat"
