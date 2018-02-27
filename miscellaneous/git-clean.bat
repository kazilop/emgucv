REM go to the folder of the current script
pushd %~p0

cd ..

cd vtk
git clean -d -f -x ""
cd ..

cd opencv
git clean -d -f -x "" 
cd ..

cd opencv_contrib
git clean -d -f -x "" 
cd ..

cd opencv_extra
git clean -d -f -x "" 
cd ..

cd Emgu.CV.Extern

cd cvblob
cd libcvblob
git clean -d -f -x "" 
cd ..
cd ..

cd tesseract
cd libtesseract

cd tesseract-ocr.git
git clean -d -f -x "" 
cd ..

cd leptonica
cd leptonica.git
git clean -d -f -x ""
cd ..
cd ..

cd ..
 
cd ..

cd ..

git clean -d -f -x "" 

popd
