# Web Scape Facebook JKN Kelantan 

# Data from KPK
library(rvest)
library(stringr)
library(xlsx)
library(readxl)
library(magrittr)
library(stringr)

# date
# my_date = Sys.Date()

# Post ID
# Must manually add the ID everyday, find from embed URL (right click date & copy url)
# https://web.facebook.com/page/711798172246954/search/?q=jumlah%20kes%20sembuh%20(discaj)%20baharu
# https://web.facebook.com/page/711798172246954/search/?q=RINGKASAN%20SITUASI%20TERKINI%20COVID-19

# jkn_url = ""; my_date = "2021-06-"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4125810847512319"; my_date = "2021-06-15"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4123438007749603"; my_date = "2021-06-14"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4120644184695652"; my_date = "2021-06-13"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4118471091579628"; my_date = "2021-06-12"
# starting from 12/6, FB JKNK no longer publish recovery in text format, only in infographic. 
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4115100038583400"; my_date = "2021-06-11"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4112281778865226"; my_date = "2021-06-10"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4109330649160339"; my_date = "2021-06-09"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4106592289434175"; my_date = "2021-06-08"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4104024509690953"; my_date = "2021-06-07"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4100630080030396"; my_date = "2021-06-06"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4098277236932347"; my_date = "2021-06-05"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4095469310546473"; my_date = "2021-06-04"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4092299590863445"; my_date = "2021-06-03"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4089165304510207"; my_date = "2021-06-02"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4085702514856486"; my_date = "2021-06-01"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4082963195130418"; my_date = "2021-05-31"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4080106208749450"; my_date = "2021-05-30"
# jkn_url = "https://m.facebook.com/HealthofKelantan/posts/4077089929051078"; my_date = "2021-05-29"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4074073062686098"; my_date = "2021-05-28"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4070791336347604"; my_date = "2021-05-27"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4067559863337418"; my_date = "2021-05-26"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4064116007015137"; my_date = "2021-05-25"
# jkn_url = "https://www.facebook.com/HealthofKelantan/posts/4060854104007994"; my_date = "2021-05-24"
# jkn_url = "https://m.facebook.com/HealthofKelantan/posts/4058160010944070"; my_date = "2021-05-23"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4055208351239236"; my_date = "2021-05-22"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4052012551558816"; my_date = "2021-05-21"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4048665015226903"; my_date = "2021-05-20"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4045875678839170"; my_date = "2021-05-19"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4041951499231588"; my_date = "2021-05-18"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4038769792883092"; my_date = "2021-05-17"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4035855349841203"; my_date = "2021-05-16"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4032929110133827"; my_date = "2021-05-15"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4029360680490670"; my_date = "2021-05-14"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4026232070803531"; my_date = "2021-05-13"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4023022244457847"; my_date = "2021-05-12"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4019921804767891"; my_date = "2021-05-11"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4016651698428235"; my_date = "2021-05-10"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4013649468728458"; my_date = "2021-05-09"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4011095628983842"; my_date = "2021-05-08"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4007248039368601"; my_date = "2021-05-07"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4004179083008830"; my_date = "2021-05-06"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/4001165866643485"; my_date = "2021-05-05"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3998030013623737"; my_date = "2021-05-04"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3995395243887214"; my_date = "2021-05-03"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3992655120827893"; my_date = "2021-05-02"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3990030354423703"; my_date = "2021-05-01"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3987074184719320"; my_date = "2021-04-30"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3984234521669953"; my_date = "2021-04-29"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3981811775245561"; my_date = "2021-04-28"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3978030538957018"; my_date = "2021-04-27"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3975108895915849"; my_date = "2021-04-26"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3972237042869701"; my_date = "2021-04-25"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3969465919813480"; my_date = "2021-04-24"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3966408056785933"; my_date = "2021-04-23"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3963539297072809"; my_date = "2021-04-22"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3960654114027994"; my_date = "2021-04-21"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3957752094318196"; my_date = "2021-04-20"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3954956787931060"; my_date = "2021-04-19"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3952093071550765"; my_date = "2021-04-18"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3949100918516647"; my_date = "2021-04-17"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3946227902137282"; my_date = "2021-04-16"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3943144435778962"; my_date = "2021-04-15"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3940315976061808"; my_date = "2021-04-14"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3937393529687386"; my_date = "2021-04-13"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3934500746643331"; my_date = "2021-04-12"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3931723070254432"; my_date = "2021-04-11"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3928763540550385"; my_date = "2021-04-10"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3925792167514189"; my_date = "2021-04-09"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3922683777825028"; my_date = "2021-04-08"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3919236488169757"; my_date = "2021-04-07"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3916347588458647"; my_date = "2021-04-06"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3912160212210718"; my_date = "2021-04-05"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3909420112484728"; my_date = "2021-04-04"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3905257032901036"; my_date = "2021-04-03"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3901435533283186"; my_date = "2021-04-02"
# jkn_url = "https://web.facebook.com/HealthofKelantan/posts/3897856060307800"; my_date = "2021-04-01"


# Read
jkn_url = str_replace(jkn_url, "web", "m")  # replace web with m, easy to scrape
jkn_url = str_replace(jkn_url, "www", "m")  # replace web with m, easy to scrape
jkn_page = try(read_html(jkn_url), T)
str(jkn_page)  # make sure html page is loaded, not error

# Get Text
my_text = html_nodes(jkn_page, "div")
# html_text(my_text)
# str(my_text)

# Recover
loc = grep("Sembuh.*Baharu", html_text(my_text), ignore.case = T, perl = T)
# loc = grep("RINGKASAN SITUASI TERKINI COVID-19 DI KELANTAN", html_text(my_text), ignore.case = T, perl = T)
loc
html_text(my_text[loc[1]])
# html_text(my_text[loc[15]])
my_text_split = str_split(html_text(my_text[loc[1]]), "KES", simplify = T)
loc1 = grep("Jumlah Kes Sembuh.*Baharu", my_text_split, ignore.case = T, perl = T)
# my_text_split[loc1]
# my_text_split1 = str_split(my_text_split[loc1], "[:] ", simplify = T)
my_text_split1 = str_split(my_text_split[loc1], "[:]", simplify = T)
sembuh = as.numeric(my_text_split1[1,2]); sembuh

# temps, to use OCR
# sembuh = 295  # 2021-06-15
# sembuh = 319  # 2021-06-14
# sembuh = 396  # 2021-06-13
# sembuh = 328  # 2021-06-12

# Read data
data_kel = data.frame(date=as.Date(my_date), recover=sembuh); data_kel
# write.csv(data_kel, "covid-19_recover_kel.csv", row.names = F)  # init
data_prev = read.csv("covid-19_recover_kel.csv")
data_prev$date = as.Date(data_prev$date)
# data_kel_updated = rbind(data_kel, data_prev); data_kel_updated  # add prev date
data_kel_updated = rbind(data_prev, data_kel); data_kel_updated  # add new date

# Write
write.csv(data_kel_updated, "covid-19_recover_kel.csv", row.names = F)
