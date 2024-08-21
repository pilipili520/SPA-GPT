files = dir('*.h5');
disp('Available H5 files:');
for i = 1:length(files)
    fprintf('%d: %s\n', i, files(i).name);
end

% select a file
disp '======= (^o^) =========';
choice = input('Enter the number of the file you want to plot (such as \"1: 6-AT89S52_ECC.h5\", input 1): ');
filename = files(choice).name;

% read h5 info
info = h5info(filename);

% print details 
stack = {info};
prefixes = {''};

while ~isempty(stack)
    current_info = stack{end};
    current_prefix = prefixes{end};
    stack(end) = [];
    prefixes(end) = [];
    
    if isfield(current_info, 'Groups')
        for i = 1:length(current_info.Groups)
            stack{end+1} = current_info.Groups(i);
            prefixes{end+1} = [current_prefix '/' current_info.Groups(i).Name];
            disp(['Group: ' current_prefix '/' current_info.Groups(i).Name]);
        end
    end
    

    if isfield(current_info, 'Datasets')
        for i = 1:length(current_info.Datasets)
            disp(['Dataset: ' current_prefix '/' current_info.Datasets(i).Name]);
            if contains(current_info.Datasets(i).Name, 'for_paper')
                data = h5read(filename, ['/' current_prefix '/' current_info.Datasets(i).Name]);
                figure;
                plot(data);
                title(strrep(current_info.Datasets(i).Name, '_', ' '));
            end
            
            
        end
    end
end
