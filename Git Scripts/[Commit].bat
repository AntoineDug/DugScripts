@echo off
cd ..

git status
echo ---------------------------ADD------------------------------
git add *
echo --------------------------STATUS----------------------------
git status
echo ------------------------------------------------------------

:commitquestion
echo.
echo (y)es or (n)o?
set /p yesno1= Commit? 
if "%yesno1%" == "n" echo no && goto end
if "%yesno1%" == "y" echo yes && goto qcommit
echo error
goto commitquestion

:qcommit
echo.
set /p message= ENTER MESSAGE: 

:validquestiongitgit
echo.
echo (y)es or (n)o?
set /p yesno2= Confirmed? 

if "%yesno2%" == "n" echo no && goto qcommit
if "%yesno2%" == "y" echo yes && goto commit
echo error
goto validquestion

:commit
echo.
echo ----------------------------LOG----------------------------
git log -n 4
echo --------------------------COMMIT---------------------------
git commit -m "%message%"
echo ----------------------------LOG----------------------------
git log -n 4
echo -----------------------------------------------------------

:pushquestion
echo.
echo (y)es or (n)o?
set /p yesno3= Push? 

if "%yesno3%" == "n" echo no && goto end
if "%yesno3%" == "y" echo yes && goto push
echo error
goto pushquestion

:push
echo.
echo ---------------------------PUSH----------------------------
git push
echo -----------------------------------------------------------

:end
echo.
pause