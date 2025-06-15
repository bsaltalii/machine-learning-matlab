clc; clear;

weather   = ["Sunny","Rain","Overcast","Sunny","Rain","Overcast","Sunny","Overcast"];
weekend   = ["No","Yes","No","Yes","No","Yes","No","No"];
delivered = ["Yes","No","Yes","No","Yes","No","Yes","Yes"];

total_yes = sum(delivered == "Yes");
total_no  = sum(delivered == "No");
total     = total_yes + total_no;

p_yes = total_yes / total;
p_no  = total_no  / total;

H_S = -p_yes*log2(p_yes) - p_no*log2(p_no);
fprintf("Total Entropy H(S) = %.3f\n", H_S);

features      = {weather, weekend};
feature_names = ["Weather", "Weekend"];

for f = 1:numel(features)
    this_feat = features{f};           
    values    = unique(this_feat);     

    H_split = 0;
    fprintf("\n=== %s ===\n", feature_names(f));

    for i = 1:numel(values)
        val = values(i);
        idx = this_feat == val;
        subset = delivered(idx);

        yes_c   = sum(subset == "Yes");
        no_c    = sum(subset == "No");
        sub_tot = yes_c + no_c;

        if yes_c == 0 || no_c == 0
            H_sub = 0;
        else
            p_y  = yes_c / sub_tot;
            p_n  = no_c / sub_tot;
            H_sub = -p_y*log2(p_y) - p_n*log2(p_n); 
        end

        fprintf("  %s: H = %.3f\n", val, H_sub);
        H_split = H_split + (sub_tot / total) * H_sub;
    end

    IG = H_S - H_split;
    fprintf("Information Gain = %.3f\n", IG);
end
