require 'mimemagic'

class MimeInspector
  # Determine the mime type of a file by looking at the contents, with a fallback to extension
  #
  # @param [String] path  The filesystem path to the file to inspect
  # @param [String] filename  The original filename of the file, if the path is a tmp file
  # @return [String] The mime type of the file
  def self.determine(path, filename=nil)
    if not filename
      filename = File.basename(path)
    end

    type = 'application/octet-stream'

    ext = File.extname(filename)[1..-1]
    get_by_ext = false

    handle = File.open(path)

    # Loop for zip files since a bunch of popular formats are zips
    four_bytes = handle.read(4)
    if four_bytes == "\x50\x4b\x03\x04"
      if ext == 'pages'
        return 'application/vnd.apple.pages'
      end
      if ext == 'key'
        return 'application/vnd.apple.keynote'
      end
      if ext == 'numbers'
        return 'application/vnd.apple.numbers'
      end
    end

    if ['docx', 'dotx', 'potx', 'ppsx', 'pptx', 'sldx', 'xlsx', 'xltx'].include?(ext)
      get_by_ext = true
    end

    if not get_by_ext
      mime = MimeMagic.by_magic(handle)
      type = mime.type if mime

      # Sometimes XLS files are reported as x-ole-storage
      if type == 'application/x-ole-storage' and ext == 'xls'
        get_by_ext = true
      end
    end

    if get_by_ext
      mime = MimeMagic.by_extension(ext)
      type = mime.type if mime
    end

    type
  end
end
