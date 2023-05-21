function [f, w] = fatWaterSlice(img1, img2, img3)
    # parameters: images of the same slice when phase difference between fat and water is
    # img1, -pi/6+k*pi
    # img2, pi/2+k*pi
    # img3, 7*pi/6+k*pi
    A = [1 sqrt(3)
        1 0
        1 -sqrt(3)];
    B = [img1(:), img2(:), img3()]';
    C = [1 2
        1 -2];
    D = [0.5 -0.5
        0.5 0.5];
    FW = D * sqrt(C * (A \ B));
    # todo fit performance
    f = reshape(FW(1, :), size(img1));
    w = reshape(FW(2, :), size(img1));
endfunction
