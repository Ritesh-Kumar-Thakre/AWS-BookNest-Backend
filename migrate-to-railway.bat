@echo off
REM ===================================================================
REM BookNest Database Migration: Local MySQL -> Railway MySQL
REM ===================================================================

SET MYSQLBIN=C:\Program Files\MySQL\MySQL Server 8.0\bin

SET LOCAL_HOST=127.0.0.1
SET LOCAL_PORT=3306
SET LOCAL_USER=root
SET LOCAL_PASS=root

SET RAILWAY_HOST=tramway.proxy.rlwy.net
SET RAILWAY_PORT=42714
SET RAILWAY_USER=root
SET RAILWAY_PASS=qtxKPfFGHsAHQQYGesgxXCCemytLjxol

SET DATABASES=booknest_auth booknest_book booknest_cart booknest_order booknest_wallet booknest_review booknest_wishlist booknest_notification

SET DUMP_DIR=%~dp0db_dumps
if not exist "%DUMP_DIR%" mkdir "%DUMP_DIR%"

echo.
echo ===================================================================
echo  BookNest Database Migration: Local -^> Railway
echo ===================================================================
echo  Local:   %LOCAL_HOST%:%LOCAL_PORT%
echo  Railway: %RAILWAY_HOST%:%RAILWAY_PORT%
echo  Databases: %DATABASES%
echo ===================================================================
echo.

echo [STEP 1] Exporting databases from local MySQL...
echo.
for %%D in (%DATABASES%) do call :DUMP_DB %%D

echo.
echo [STEP 1 COMPLETE] All dumps saved to: %DUMP_DIR%
echo.

echo [STEP 2] Importing databases into Railway MySQL...
echo NOTE: This may take a few minutes depending on data size and network speed.
echo.
for %%D in (%DATABASES%) do call :IMPORT_DB %%D

echo.
echo ===================================================================
echo  Migration Complete!
echo ===================================================================
echo.
pause
goto :EOF

:DUMP_DB
echo   Dumping %1 ...
"%MYSQLBIN%\mysqldump" -h %LOCAL_HOST% -P %LOCAL_PORT% -u %LOCAL_USER% -p%LOCAL_PASS% --single-transaction --routines --triggers --set-gtid-purged=OFF %1 > "%DUMP_DIR%\%1.sql" 2>nul
if errorlevel 1 (
    echo   [WARNING] %1 - dump failed or doesn't exist
) else (
    echo   [OK] %1 exported
)
goto :EOF

:IMPORT_DB
if not exist "%DUMP_DIR%\%1.sql" (
    echo   [SKIP] %1 - no dump file
    goto :EOF
)
echo   Creating database %1 on Railway...
"%MYSQLBIN%\mysql" -h %RAILWAY_HOST% -P %RAILWAY_PORT% -u %RAILWAY_USER% -p%RAILWAY_PASS% -e "CREATE DATABASE IF NOT EXISTS %1;" 2>nul
echo   Importing %1 ...
type "%DUMP_DIR%\%1.sql" | "%MYSQLBIN%\mysql" -h %RAILWAY_HOST% -P %RAILWAY_PORT% -u %RAILWAY_USER% -p%RAILWAY_PASS% %1 2>nul
if errorlevel 1 (
    echo   [ERROR] %1 - import failed!
) else (
    echo   [OK] %1 imported successfully
)
goto :EOF
