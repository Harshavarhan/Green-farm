@echo off
echo Setting up Python Backend Environment...

REM Create Python virtual environment
python -m venv backend\venv

REM Activate virtual environment
call backend\venv\Scripts\activate

REM Install requirements
cd backend
pip install -r requirements.txt

echo Backend setup completed!
pause 