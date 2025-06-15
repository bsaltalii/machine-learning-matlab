clc; clear;

labels = ["No", "No", "Yes", "Yes", "Yes", "No", "Yes", "Yes", "Yes", "Yes"];

weather = ["Sunny", "Sunny", "Overcast", "Rain", "Rain", "Rain", ...
           "Overcast", "Sunny", "Sunny", "Rain"];

total_yes = sum(labels == "Yes");
total_no = sum(labels == "No");
total = total_yes + total_no;

p_yes = total_yes / total;
p_no = total_no / total;

H_S = -p_yes*log2(p_yes) - p_no*log2(p_no);

fprintf("Total Entropy (H(S)) : %.3f \n",H_S);

values = unique(weather);
H_split = 0;

for i = 1:length(values)
    val = values(i);
    idx = weather == val;
    subset_labels = labels(idx);

    yes_count = sum(subset_labels == "Yes");
    no_count = sum(subset_labels == "No");
    subset_total = yes_count + no_count;

    if yes_count == 0 || no_count == 0
        H_sub = 0;
    else
        p_yes_sub = yes_count / subset_total;
        p_no_sub = no_count / subset_total;
        H_sub = -p_yes_sub*log2(p_yes_sub) - p_no_sub*log(p_no_sub);
    end

    fprintf("Entropy for %s: %.3f\n",val , H_sub);

    H_split = H_split + (subset_total / total) * H_sub;
end

IG = H_S - H_split;
fprintf("Information Gain for 'Weather': %.3f\n", IG);