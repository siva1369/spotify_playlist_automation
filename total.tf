provider "spotify" {
  client_id     = "your_client_id"
  client_secret = "your_client_secret"
}

# Create a playlist with a specific track
resource "spotify_playlist" "tollywood" {
  name        = "My melodies"
  description = "My playlist is so awesome"
 
  tracks = ["37i9dQZF1DWTt3gMo0DLxA"] # Ensure this track ID exists on Spotify
}

# Search for tracks by artist
data "spotify_search_track" "venkatesh" {
  artist = "Venkatesh" # Replace with the actual artist's name
  limit  = 10
}

# Create a playlist with tracks found via the data source
resource "spotify_playlist" "venkatesh" {
  name        = "venky_hits"
  description = "Playlist of Venkatesh's hits"

  # Reference the tracks from the data source
  tracks = [
    data.spotify_search_track.venkatesh.tracks[0].id,
    data.spotify_search_track.venkatesh.tracks[1].id,
    data.spotify_search_track.venkatesh.tracks[2].id,
  ]
}
