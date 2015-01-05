module UploadHelper

  UPLOADS_FOLDER = 'public'

  # writes file to rails project directory
  # returns path to uploaded file
  def write(directory, file)

    dir = Rails.root.join(UPLOADS_FOLDER, directory)
    unless File.directory? dir
      FileUtils::mkdir_p dir
    end

    path = Rails.root.join(UPLOADS_FOLDER, directory, file.original_filename)
    File.open(path, 'wb') do |f|
      f.write(file.read)
    end

    return '/' + directory + '/' + file.original_filename

  end

  # uploads file to creator directory with
  # file_name as the new file name
  def creator_upload(username, file_name, file)
    dir = "creators/#{username}"
    file.original_filename = file_name + (File.extname file.original_filename)
    return write(dir, file)
  end

end
