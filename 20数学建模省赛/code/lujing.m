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
      %�ж����Ƿ�Ҫ�ڸõ�ͣ��
      if t<=Ha(b(i))
          f = b(i);
          return;
      end
      t = t-Ha(k(i));
      %�ж��Ƿ�����;���Ѿ�ͣ��
      if t<=time_i_j(b(i),b(i+1))
          f =-1;
          return;
      end
      t = t-time_i_j(b(i),b(i+1));
      %������һ������
      i=i+1;
  end
  f = -1;
end