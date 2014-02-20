require 'execjs'
require 'myth/source'

module Myth
  Error               = ExecJS::Error
  EngineError         = ExecJS::RuntimeError
  PreprocessingError  = ExecJS::ProgramError

  module Source
    def self.path
      @path ||= ENV['MYTH_SOURCE_PATH'] || bundled_path
    end

    def self.path=(path)
      @contents = @version = @context = nil
      @path = path
    end

    def self.contents
      @contents ||= File.read(path)
    end

    def self.version
      @version ||= contents[/Myth Preprocessor v([\d.]+)/, 1]
    end

    def self.context
      # Window or self has to be added so myth can attach to something
      @context ||= ExecJS.compile("preprocess=function(css,options){try{css=myth(css,options);}catch(e){e.css=css;throw e;}return css;};if(typeof self==\"undefined\")self={};" + contents + "if(self.myth)myth=self.myth;")
    end
  end

  class << self
    def engine
    end

    def engine=(engine)
    end

    def version
      Source.version
    end

    # Preprocess a stylesheet (String or IO).
    def preprocess(script, options = {})
      script = script.read if script.respond_to?(:read)

      Source.context.call("preprocess", script, options)
    end
  end
end
