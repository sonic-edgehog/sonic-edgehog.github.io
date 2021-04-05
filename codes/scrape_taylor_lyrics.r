install.packages("genius")
install.packages("tidyverse")
library(genius)
library(tidyverse)
df_discography <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=character(), 
                 stringsAsFactors=FALSE) 
album_list = c("Taylor Swift","Fearless","Speak Now","Red","1989","reputation","Lover","folklore",'evermore')
for (album_name in album_list)
    {
    ts_discography = genius_album(artist = "Taylor Swift", album = album_name)%>%mutate(album = album_name)
    df_discography = rbind(df_discography,ts_discography)
    }
dim(df_discography)
#Patterns to be removed from the data
remove.list = paste(c("Demo Recording", "Voice Memo", "Pop Version", "Acoustic Version"), collapse = '|')
df_discography = df_discography%>%filter(!grepl(remove.list, track_title)) 
dim(df_discography)
write.csv(df_discography,'taylor_swift_lyrics.csv')