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
    mime = MimeMagic.by_magic(File.open(path))
    if mime
      type = mime.type

      # Specifically handle situations where Office XML files are detected
      # as zip files (since they really are)
      ext = File.extname(filename)[1..-1]
      
      get_by_ext = false
      
      office_exts = ['docx', 'dotx', 'potx', 'ppsx', 'pptx', 'sldx', 'xlsx', 'xltx']
      if type == 'application/zip' and office_exts.include? ext
        get_by_ext = true
        
      elsif type == 'application/x-ole-storage' and ext == 'xls'
        get_by_ext = true
      end

      if get_by_ext
        mime = MimeMagic.by_extension(ext)
        type = mime.type if mime
      end
    end
    type
  end
end