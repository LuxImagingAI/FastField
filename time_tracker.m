function time_tracker(massage)
% this function is adapted from Lead-DBS ea_dispt function

timer_value=getappdata(0,'timer_value');

if ~isempty(timer_value)
    t_end=toc(timer_value);
    fprintf(1,'\b');
    fprintf(1,'%s\n',['. (Performance time = ',num2str(t_end),' s)']);
end

if ~isempty(massage)
    disp(massage);
    t_start=tic;
    setappdata(0,'timer_value',t_start);
else
    setappdata(0,'timer_value',[]);
end

end
