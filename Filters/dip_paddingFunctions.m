function arr = add_padding(arr, v)
    first_row = arr(1:v,:);    
    last_row = arr(end-v:end,:);
    arr = [first_row; arr; last_row];
    
    first_colum = arr(:,1:v);
    last_colum = arr(:,end-v:end);
    arr = [first_colum arr last_colum];
end


%Put your codes here for filtering


function arr = remove_padding(arr, v)
    arr(1:v,:)=[];
    arr(end-v:end,:)=[];
    arr(:,1:v)=[];
    arr(:,end-v:end)=[];
end
