$:.unshift(File.expand_path('../../vendor', __FILE__))
require 'rails'
require 'tempfile'

Tempfile.class_eval do
  # overwrite so tempfiles use the extension of the basename.  important for rmagick and image science
  def make_tmpname(basename, n)
    ext = nil
    sprintf("%s%d-%d%s", basename.to_s.gsub(/\.\w+$/) { |s| ext = s; '' }, $$, n.to_i, ext)
  end
end

require 'geometry'

module AttachmentFu
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("..", __FILE__)
    initializer 'attachment_fu' do
      require 'technoweenie/attachment_fu'
      ActiveRecord::Base.send(:extend, Technoweenie::AttachmentFu::ActMethods)
      Technoweenie::AttachmentFu.tempfile_path = ATTACHMENT_FU_TEMPFILE_PATH if Object.const_defined?(:ATTACHMENT_FU_TEMPFILE_PATH)
      FileUtils.mkdir_p Technoweenie::AttachmentFu.tempfile_path
    end
  end
end
