# combine recovery data with other data for Kelantan

# baselines by 1-4-2021
baseline = read.csv(header = T, text = '
"date","new_cases","total_cases","new_deaths","total_deaths","recover","total_recover"
2021-04-01,27,6277,1,24,62,5659
')
baseline$date = as.Date(baseline$date)

data_kel_recover = read.csv("covid-19_recover_kel.csv")
data_my_state = read.csv("covid-19_my_state.csv")
# data_my_state = read.csv("https://wnarifin.github.io/covid-19-malaysia/covid-19_my_state.csv")
data_my_state$date = as.Date(data_my_state$date)
data_kel_rest = subset(data_my_state, date >= "2021-04-01" & state == "KELANTAN", -state)
data_kel_rest$recover = NA
data_kel_rest$total_recover = NA
data_kel_all = data_kel_rest
data_kel_all$recover = data_kel_recover$recover
data_kel_all$total_recover = (baseline$total_recover-baseline$recover) + cumsum(data_kel_all$recover)
# row.names(data_kel_all) = 1:nrow(data_kel_all)  # if we want new row numbers
# but keep as it is for easy cross ref with "covid-19_my_state.csv"
data_kel_all
# it seems that starting from April 13, adding new recovered cases does not tally with
# total recovered cases reported in FB page, could be miscounting from JKN Kelantan side?
# as of May 9, off by 9 cases
# we use cumulative recovered cases from baseline data by 1-4-2021 instead of direct data from FB

# Write
write.csv(data_kel_all, "covid-19_kel.csv", row.names = F)
# can be accessed directly as
# https://raw.githubusercontent.com/wnarifin/covid-19-kelantan/main/covid-19_kel.csv
