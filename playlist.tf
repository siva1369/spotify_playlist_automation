resource "spotify_playlist" "tollywood" {
  name        = "My melodies"
  description = "My playlist is so awesome"
 
  tracks = ["37i9dQZF1DWTt3gMo0DLxA, 4fn6qJJKGwyJ3qNkhkIJnJ"]

}

data "spotify_search_track" "venkatesh" {
  artist = "venkatesh"
  limit = 10
}


resource "spotify_playlist" "venky_hits" {
  name        = "venky_hits"

  tracks = [spotify_search_track.venkatesh.tracks[0].id,
    spotify_search_track.venkatesh.tracks[1].id, 
    spotify_search_track.venkatesh.tracks[2].id]
}




