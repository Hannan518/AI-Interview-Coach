@echo off
cd /d "%~dp0"

echo Starting Backend...
start "AI Coach Backend" cmd /c "cd /d backend && .\venv\Scripts\python.exe -m uvicorn app.main:app --reload"

echo Starting Frontend...
start "AI Coach Frontend" cmd /c "cd /d frontend && npm run dev"

echo.
echo Both servers started in separate windows.
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:3000
echo Close their windows to stop each server.
