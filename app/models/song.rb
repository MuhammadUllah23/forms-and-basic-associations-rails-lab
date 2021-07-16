class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
  
  if !name.blank?
    self.artist = Artist.find_or_create_by(name: name)
  end
end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note)
    
    note.each do |n|
      if !n.blank?
        self.notes.build(content: n)
        self.save
      end
    end
  end


  
end
