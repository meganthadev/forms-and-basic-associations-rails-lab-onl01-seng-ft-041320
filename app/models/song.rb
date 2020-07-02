class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 
  

   def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

   def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end
  
  def song_notes
    ret = []
    self.notes.each do |note|
      ret << note.content unless note.content.empty?
    end
    ret
  end

  



end
