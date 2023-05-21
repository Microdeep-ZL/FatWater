function fatWaterDICOM(E1, E2, E3)
    # E1,2,3 stand for E numbers
    # Example: octave-cli --eval 'addpath("path/to/FatWater/");fatWaterDICOM(10,11,12)"
    pkg load dicom
    files = dir(fullfile(E1, "pdata/1/dicom/*.dcm"));
    files = {files.name};
    mkdir(E1,"pdata/1001/dicom")
    mkdir(E1,"pdata/1002/dicom")
    for i = 1:numel(files)
        img1 = dicomread(fullfile(E1, "pdata/1/dicom", files(i)));
        img2 = dicomread(fullfile(E2, "pdata/1/dicom", files(i)));
        img3 = dicomread(fullfile(E3, "pdata/1/dicom", files(i)));
        info = dicominfo(fullfile(E1, "pdata/1/dicom", files(i)));
        [f, w] = fatWaterSlice(img1, img2, img3);
        dicomwrite(f, fullfile(E1,"pdata/1001/dicom",files(i)), info);
        dicomwrite(w, fullfile(E1,"pdata/1002/dicom",files(i)), info);
    endfor
endfunction
