function [f, w] = fatWaterVoxel(v1, v2, v3)
  # v1, phase difference between fat and water = -pi/6+k*pi
  # v2, phase difference between fat and water = pi/2+k*pi
  # v3, phase difference between fat and water = 7*pi/6+k*pi
  v = [v1; v2; v3];
  A = [1 sqrt(3)
    1 0
    1 -sqrt(3)];
  # f, fat
  # w, water
  # w is considered to be much greater than f
  # x = w^2+f^2
  # y = wf
  [x, y] = (A \ b)';
  # c = w+f
  # d = |w-f|
  c = sqrt(x + 2 * y);
  d = sqrt(x - 2 * y);
  f = (c - d) / 2;
  w = (c + d) / 2;
endfunction
