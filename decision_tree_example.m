clc; clear;

labels = ["No", "No", "Yes", "Yes", "Yes", "No", "Yes", "Yes", "No", "Yes"];
windy  = ["False", "True", "False", "False", "True", "True", ...
          "False", "False", "True", "True"];

total_yes = sum(labels == "Yes");
total_no = sum(labels == "No");
total = total_yes + total_no;

p_yes = total_yes / total;
p_no = total_no / total;
H_S = -p_yes*log2(p_yes)-p_no*log2(p_no);

values = unique(windy);
H_split = 0;

for i = 1:length(values)
    val = values(i);
    idx = windy == val;
    subset_labels = labels(idx);

    yes_count = sum(subset_labels == "Yes");
    no_count = sum(subset_labels == "No");
    total_count = yes_count + no_count;

    if yes_count == 0 || no_count == 0
        H_sub = 0;
    else
        p_yes_sub = yes_count / total_count;
        p_no_sub = no_count / total_count;
        H_sub = -p_yes_sub*log2(p_yes_sub) - p_no_sub*log2(p_no_sub);
    end
    fprintf("Entropy for %s : %.3f\n",val,H_sub);

    H_split = H_split + (total_count / total) * H_sub;
end
    IG = H_S - H_split;
    fprintf("Information Gain for 'Windy' : %.3f ",IG);

