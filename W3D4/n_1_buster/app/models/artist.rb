class Artist < ActiveRecord::Base
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # Track.select("albums.title AS atitle, COUNT(tracks.*)")
    #     .joins(:album)
    #     .where(albums: {artist_id: id})
    #     .group(:album_id)
    Album.joins(:tracks)
          .where(artist_id: id)
          .group('albums.title')
          .order('COUNT(*) DESC')
          .count
  end
end
