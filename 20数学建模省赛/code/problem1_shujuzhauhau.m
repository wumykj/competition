clear
clc
load res_jieguo;
load X
load Y
x1=X(1)-X(84);
y1=Y(1)-Y(84);
k_x=y1/x1;
b_x=Y(1)-k_x*X(1);
res = res_jihe;
[n,m,k] = size(res);
new_data = zeros(5,10,6);
for t = 1:k
    for i = 1:n
        if res(i,1,t) == 0
            break;
        else
            bi = panduan(res(i,1,t),res(i,2,t),X,Y);
            ceng = res(i,3,t);
            for q = 1:10
                if new_data(ceng,q,t) == 0
                    new_data(ceng,q,t) = bi;
                    break;
                end
            end
        end
    end
end
[n,m,k] = size(new_data);
for t = 1:k
    for i = 1:n
        %如果这类没被用到直接跳出
        if new_data(i,1,t) ==0
            continue
        end
        %读取整个类进行处理
        a = new_data(i,:,t);
        for j=1:length(a)
            if a(j) == 0
                break;
            end
        end
        %找到该类有j—1个元素
        a = a(1:j-1);
        b = zeros(2,j-1);
        %找到每个点对应的x值
        for o=1:j-1
            b(1,o)=a(o);
            %按照每个点的车对应值
            b(2,o)= line_x(x1,y1,k_x,b_x,X(a(o)),Y(a(o)));
        end
        b = b';
        b = paixun_rows(b,2);
        a = b(:,1)';
        new_data(i,1:j-1,t)=a;
    end 
end

