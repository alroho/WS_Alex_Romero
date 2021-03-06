#star_warsURL <- c("https://www.imdb.com/title/tt0120915/?ref_=fn_al_tt_2", "https://www.imdb.com/title/tt0121765/?ref_=fn_al_tt_10", "https://www.imdb.com/title/tt0121766/?ref_=fn_al_tt_3", "https://www.imdb.com/title/tt0076759/?ref_=fn_al_tt_7", "", "", "", "")
star_wars_movies <- read_html("https://www.imdb.com/list/ls070150896/")

url_film <- star_wars_movies %>% 
  html_nodes("h3 a") %>%
  html_attr('href')

class(url_film)
urls <- character()

for(i in 1:8){
  urls[i] <- paste0("https://www.imdb.com",url_film[i])
}

cast = list()
n = 1
for(i in urls){
  film <- read_html(i)
  cast[[n]] <- film %>%
  html_nodes("#titleCast .itemprop span") %>%
  html_text()
  n = n + 1
}

sort(table(unlist(cast)), dec=TRUE)

