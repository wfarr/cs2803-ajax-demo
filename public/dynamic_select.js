window.updateArtists = function updateArtists() {
  selectedGenre = $('genres_select').value;
  if (selectedGenre == 0) {
    $('artists_select').innerHTML = '';
    $('artists_select').disable();
    $('songs_select').innerHTML = '';
    $('songs_select').disable();
  } else {
    new Ajax.Request('/artists', {
      method: "get",
      parameters: {
        genre_id: selectedGenre
      },
      onSuccess: function(response) {
        parsed = JSON.parse(response.responseText);
        if (parsed.length > 0) {
          retVal = "<option value='0'>Select an artist</option>";
          parsed.each(function(obj) {
            artist = obj.artist;
            retVal += '<option value="' + artist.id + '">' + artist.name + '</option>';
          });
          $('artists_select').innerHTML = retVal;
          $('artists_select').enable();
          $('songs_select').innerHTML = '';
          $('songs_select').disable();

        } else {
          alert("There aren't any artists for that genre!");
          $('artists_select').innerHTML = '';
          $('artists_select').disable();
          $('songs_select').innerHTML = '';
          $('songs_select').disable();
        }
      },
      onFailure: function(response) {
        alert("The server sent a bad response!");
      },
      onException: function(response) {
        alert("Could not get a response from the server!");
      }
    });
  }
}

window.updateSongs = function updateSongs() {
  selectedArtist = $('artists_select').value;
  if (selectedArtist == 0) {
    $('songs_select').innerHTML = '';
    $('songs_select').disable();
  } else {
    new Ajax.Request('/songs', {
      method: "get",
      parameters: {
        artist_id: selectedArtist
      },
      onSuccess: function(response) {
        parsed = JSON.parse(response.responseText);
        if (parsed.length > 0) {
          retVal = "<option value='0'>Select a song</option>";
          parsed.each(function(obj) {
            song = obj.song;
            retVal += '<option value="' + song.id + '">' + song.name + '</option>';
          });
          $('songs_select').innerHTML = retVal;
          $('songs_select').enable();
        } else {
          alert("There aren't any songs for that artist!");
          $('songs_select').innerHTML = '';
          $('songs_select').disable();
        }
      },
      onFailure: function(response) {
        alert("The server sent a bad response!");
      },
      onException: function(response) {
        alert("Could not get a response from the server!");
      }
    });
  }
}

window.validateInput = function validateInput() {
  selectedGenre  = $('genres_select').value;
  selectedArtist = $('artists_select').value;
  selectedSong   = $('songs_select').value;
  if ((selectedGenre == 0) || (selectedArtist == 0) || (selectedSong == 0)) {
    alert("You must select a genre, artist, and song!");
    return false;
  }
}