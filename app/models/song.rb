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

  def genre=(id)
    self.genre_id = id.to_i
  end

  def note_contents
    content = []
    self.notes.each do |note|
      content << note.content
    end
    content
  end


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end

end
