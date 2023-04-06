function [f] = lujing(k,t,time_i_j,Ha)
  b = k;
  if t<=0
      f = -1;
      return;
  end
  if t<=time_i_j(b(1),b(2))
      f =-1;
      return;
  end
  i=2;
  t = t-time_i_j(b(1),b(2));
  while i<length(k)
      %判断它是否要在该点停留
      if t<=Ha(b(i))
          f = b(i);
          return;
      end
      t = t-Ha(k(i));
      %判断是否在中途就已经停了
      if t<=time_i_j(b(i),b(i+1))
          f =-1;
          return;
      end
      t = t-time_i_j(b(i),b(i+1));
      %进入下一步迭代
      i=i+1;
  end
  f = -1;
end