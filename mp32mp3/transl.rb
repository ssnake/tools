
# encoding: utf-8
require 'mp3info'
require 'russian'
#require 'ruby-debug'


def traslite_file(mp3_file)
    Mp3Info.open(mp3_file,  ) do |mp3|    
        puts "FOR #{mp3_file}"
 #       debugger
        puts mp3
        title  = mp3.tag.title || File.basename(mp3_file)
        
        artist = mp3.tag.artist 
        
        album  = mp3.tag.album
        puts album.force_encoding("CP866").encode("CP1251", replace: "").encode("utf-8")
        #t_title, t_artist, t_album = [title, artist, album].map{ |x| Russian.translit(x || "") }
        #puts "#{artist}: #{album} - #{title}"
        #puts "#{t_artist}: #{t_album} - #{t_title}"

        #### uncomment for the final run!
        # mp3.tag.title = t_title
        # mp3.tag.artist = t_artist
        # mp3.tag.album = t_album
        #File.rename(mp3_file, File.join(File.dirname(mp3_file),t_title+".mp3"))
  end

end
if self.inspect == 'main'
files = Dir['**/*.mp3']

files.each do |mp3_file|
    traslite_file mp3_file
end  
end

