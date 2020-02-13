@echo off
cd ..

echo CONFLICTED FILES:
git diff --name-only --diff-filter=U
echo -----------------------------------------------------------

:mergetoolquestion
echo.
echo (y)es or (n)o?
set /p yesno1= Use MergeTool? 
if "%yesno1%" == "n" echo no && goto mergecontinuequestion
if "%yesno1%" == "y" echo yes && goto mergetool
echo error
goto mergetoolquestion

:mergetool
echo ------------------------MERGETOOL--------------------------
git mergetool -t tortoisemerge -y
echo -----------------------------------------------------------

echo CONFLICTED FILES:
git diff --name-only --diff-filter=U
echo -----------------------------------------------------------

:mergecontinuequestion
echo.
echo (y)es or (n)o?
set /p yesno1= Resolve Merge? 
if "%yesno1%" == "n" echo no && goto mergeabortquestion
if "%yesno1%" == "y" echo yes && goto mergecontinue
echo error
goto mergecontinuequestion

:mergecontinue
echo ---------------------MERGE-CONTINUE------------------------
git merge --continue
echo -----------------------------------------------------------
goto end

:mergeabortquestion
echo.
echo (y)es or (n)o?
set /p yesno1= abort Merge? 
if "%yesno1%" == "n" echo no && goto end
if "%yesno1%" == "y" echo yes && goto mergeabort
echo error
goto mergecontinuequestion

:mergeabort
echo -----------------------MERGE-ABORT-------------------------
git merge --abort
echo -----------------------------------------------------------

:end
echo.
pause