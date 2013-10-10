class Image < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image,
    :styles => {
		:thumb=> "75x75#",
		:main  => "300x300",
		:list => "150x150>"
    }

    def from_url(url)
	  extname = File.extname(url)
	  basename = File.basename(url, extname)
	  file = Tempfile.new([basename, extname])
	  file.binmode
	  open(URI.parse(url)) do |data|
	    file.write data.read
	  end
	  file.rewind
	  self.image = file
	  self
	end
end
